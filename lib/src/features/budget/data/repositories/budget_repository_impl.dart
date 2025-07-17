import '../budget_repository.dart';
import '../datasources/local/budget_local_data_source.dart';
import '../datasources/remote/budget_remote_data_source.dart';
import '../../domain/budget.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetLocalDataSource _localDataSource;
  final BudgetRemoteDataSource _remoteDataSource;
  
  BudgetRepositoryImpl(this._localDataSource, this._remoteDataSource);
  
  @override
  Future<Budget?> getCurrentBudget() async {
    try {
      // Try local first for fast access
      final localBudget = await _localDataSource.getCurrentBudget();
      if (localBudget != null) {
        return localBudget;
      }
      
      // Fallback to remote
      final remoteBudget = await _remoteDataSource.getCurrentBudget();
      if (remoteBudget != null) {
        // Cache locally
        await _localDataSource.saveBudget(remoteBudget);
        return remoteBudget;
      }
      
      return null;
    } catch (e) {
      // If remote fails, try local as fallback
      return await _localDataSource.getCurrentBudget();
    }
  }
  
  @override
  Future<void> saveBudget(Budget budget) async {
    // Save locally first for immediate access
    await _localDataSource.saveBudget(budget);
    
    try {
      // Sync to remote
      await _remoteDataSource.saveBudget(budget);
    } catch (e) {
      // Log error but don't fail the operation
      // The sync will be retried later
    }
  }
  
  @override
  Future<void> updateBudget(Budget budget) async {
    await saveBudget(budget);
  }
  
  @override
  Future<void> deleteBudget(String id) async {
    await _localDataSource.deleteBudget();
    
    try {
      await _remoteDataSource.deleteBudget(id);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Stream<Budget?> watchBudget() {
    // Return local stream for immediate updates
    return _localDataSource.watchBudget();
  }
}