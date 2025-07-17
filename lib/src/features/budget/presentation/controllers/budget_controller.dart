import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/budget.dart';
import '../../domain/budget_calculation.dart';
import '../../../../shared/providers/repository_providers.dart';
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
      print('DEBUG: Budget is null');
      return null;
    }
    
    print('DEBUG: Budget found - monthlyBudget: ${budget.monthlyBudget}, monthEndDay: ${budget.monthEndDay}');
    
    final transactionRepository = await ref.watch(transactionRepositoryProvider.future);
    final transactions = await transactionRepository.getCurrentMonthTransactions();
    
    print('DEBUG: Found ${transactions.length} transactions this month');
    
    final now = DateTime.now();
    final monthEndDate = DateTime(now.year, now.month, budget.monthEndDay);
    final adjustedMonthEndDate = monthEndDate.isBefore(now) 
        ? DateTime(now.year, now.month + 1, budget.monthEndDay)
        : monthEndDate;
    
    final remainingDays = adjustedMonthEndDate.difference(now).inDays + 1;
    final monthlySpent = transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
    final remainingBudget = budget.monthlyBudget - monthlySpent;
    final todaySpendable = remainingDays > 0 ? remainingBudget / remainingDays : 0.0;
    
    print('DEBUG: monthlySpent: $monthlySpent, remainingDays: $remainingDays, todaySpendable: $todaySpendable');
    
    final calculation = BudgetCalculation(
      todaySpendable: todaySpendable,
      remainingDays: remainingDays,
      monthlySpent: monthlySpent,
      monthlyBudget: budget.monthlyBudget,
      monthEndDate: adjustedMonthEndDate,
    );
    
    print('DEBUG: BudgetCalculation created successfully');
    return calculation;
  } catch (e, stackTrace) {
    print('DEBUG: Error in budgetCalculationProvider: $e');
    print('DEBUG: StackTrace: $stackTrace');
    return null;
  }
});