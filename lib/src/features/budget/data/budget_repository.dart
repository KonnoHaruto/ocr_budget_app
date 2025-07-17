import '../domain/budget.dart';

abstract class BudgetRepository {
  /// Get the current budget settings
  Future<Budget?> getCurrentBudget();
  
  /// Save budget settings
  Future<void> saveBudget(Budget budget);
  
  /// Update budget settings
  Future<void> updateBudget(Budget budget);
  
  /// Delete budget settings
  Future<void> deleteBudget(String id);
  
  /// Stream of budget changes
  Stream<Budget?> watchBudget();
}