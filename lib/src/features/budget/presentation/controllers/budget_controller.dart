import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/budget.dart';
import '../../domain/budget_calculation.dart';
import '../../../../shared/providers/repository_providers.dart';
import 'package:uuid/uuid.dart';

class BudgetController extends AsyncNotifier<Budget?> {
  @override
  Future<Budget?> build() async {
    final repository = ref.watch(budgetRepositoryProvider);
    return await repository.getCurrentBudget();
  }

  Future<void> createBudget({
    required double monthlyBudget,
    required int monthEndDay,
  }) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(budgetRepositoryProvider);
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
      final repository = ref.read(budgetRepositoryProvider);
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
      final repository = ref.read(budgetRepositoryProvider);
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
  final budget = await ref.watch(budgetControllerProvider.future);
  if (budget == null) return null;
  
  final transactionRepository = ref.watch(transactionRepositoryProvider);
  final transactions = await transactionRepository.getCurrentMonthTransactions();
  
  final now = DateTime.now();
  final monthEndDate = DateTime(now.year, now.month, budget.monthEndDay);
  final adjustedMonthEndDate = monthEndDate.isBefore(now) 
      ? DateTime(now.year, now.month + 1, budget.monthEndDay)
      : monthEndDate;
  
  final remainingDays = adjustedMonthEndDate.difference(now).inDays + 1;
  final monthlySpent = transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
  final remainingBudget = budget.monthlyBudget - monthlySpent;
  final todaySpendable = remainingDays > 0 ? remainingBudget / remainingDays : 0.0;
  
  return BudgetCalculation(
    todaySpendable: todaySpendable,
    remainingDays: remainingDays,
    monthlySpent: monthlySpent,
    monthlyBudget: budget.monthlyBudget,
    monthEndDate: adjustedMonthEndDate,
  );
});