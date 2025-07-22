import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/budget.dart';
import '../../domain/budget_calculation.dart';
import '../../domain/transaction.dart';
import '../../../../shared/providers/repository_providers.dart';
import 'transaction_controller.dart';
import 'daily_budget_controller.dart';
import 'package:uuid/uuid.dart';

class BudgetController extends AsyncNotifier<Budget?> {
  @override
  Future<Budget?> build() async {
    final repository = await ref.watch(budgetRepositoryProvider.future);
    return await repository.getCurrentBudget();
  }

  Future<void> createBudget({
    required double monthlyBudget,
    required int monthEndDay,
  }) async {
    state = const AsyncLoading();
    
    try {
      final repository = await ref.read(budgetRepositoryProvider.future);
      final budget = Budget(
        id: const Uuid().v4(),
        monthlyBudget: monthlyBudget,
        monthEndDay: monthEndDay,
        createdAt: DateTime.now(),
      );
      
      await repository.saveBudget(budget);
      state = AsyncValue.data(budget);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateBudget({
    required double monthlyBudget,
    required int monthEndDay,
  }) async {
    final currentBudget = state.value;
    if (currentBudget == null) return;
    
    state = const AsyncLoading();
    
    try {
      final repository = await ref.read(budgetRepositoryProvider.future);
      final updatedBudget = currentBudget.copyWith(
        monthlyBudget: monthlyBudget,
        monthEndDay: monthEndDay,
      );
      
      await repository.updateBudget(updatedBudget);
      state = AsyncValue.data(updatedBudget);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteBudget() async {
    final currentBudget = state.value;
    if (currentBudget == null) return;
    
    state = const AsyncLoading();
    
    try {
      final repository = await ref.read(budgetRepositoryProvider.future);
      await repository.deleteBudget(currentBudget.id);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final budgetControllerProvider = AsyncNotifierProvider<BudgetController, Budget?>(
  () => BudgetController(),
);

// Budget calculation provider
final budgetCalculationProvider = FutureProvider<BudgetCalculation?>((ref) async {
  try {
    final budget = await ref.watch(budgetControllerProvider.future);
    if (budget == null) {
      debugPrint('DEBUG: Budget is null');
      return null;
    }
    
    debugPrint('DEBUG: Budget found - monthlyBudget: ${budget.monthlyBudget}, monthEndDay: ${budget.monthEndDay}');
    
    // Watch transaction controller state for automatic updates
    final transactionState = ref.watch(transactionControllerProvider);
    final transactions = await transactionState.when(
      data: (allTransactions) async {
        final now = DateTime.now();
        final startOfMonth = DateTime(now.year, now.month, 1);
        final endOfMonth = DateTime(now.year, now.month + 1, 0);
        
        return allTransactions.where((transaction) {
          return transaction.date.isAfter(startOfMonth.subtract(const Duration(days: 1))) &&
                 transaction.date.isBefore(endOfMonth.add(const Duration(days: 1)));
        }).toList();
      },
      loading: () async => <Transaction>[],
      error: (error, stackTrace) async => <Transaction>[],
    );
    
    debugPrint('DEBUG: Found ${transactions.length} transactions this month');
    
    final now = DateTime.now();
    final monthEndDate = DateTime(now.year, now.month, budget.monthEndDay);
    final adjustedMonthEndDate = monthEndDate.isBefore(now) 
        ? DateTime(now.year, now.month + 1, budget.monthEndDay)
        : monthEndDate;
    
    final remainingDays = adjustedMonthEndDate.difference(now).inDays + 1;
    final monthlySpent = transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
    final remainingBudget = budget.monthlyBudget - monthlySpent;
    
    final dailyBudget = await ref.read(dailyBudgetControllerProvider.future);
    final todayBudget = dailyBudget?.amount ?? 0.0;
    
    debugPrint('DEBUG: monthlySpent: $monthlySpent, remainingDays: $remainingDays, todayBudget: $todayBudget');
    
    final calculation = BudgetCalculation(
      todayBudget: todayBudget,
      remainingDays: remainingDays,
      monthlySpent: monthlySpent,
      monthlyBudget: budget.monthlyBudget,
      remainingBudget: remainingBudget,
      monthEndDate: adjustedMonthEndDate,
    );
    
    debugPrint('DEBUG: BudgetCalculation created successfully');
    return calculation;
  } catch (e, stackTrace) {
    debugPrint('DEBUG: Error in budgetCalculationProvider: $e');
    debugPrint('DEBUG: StackTrace: $stackTrace');
    return null;
  }
});