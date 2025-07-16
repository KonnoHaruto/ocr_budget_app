import '../transaction_repository.dart';
import '../datasources/local/transaction_local_data_source.dart';
import '../datasources/remote/transaction_remote_data_source.dart';
import '../../domain/transaction.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionLocalDataSource _localDataSource;
  final TransactionRemoteDataSource _remoteDataSource;
  
  TransactionRepositoryImpl(this._localDataSource, this._remoteDataSource);
  
  @override
  Future<List<Transaction>> getTransactions() async {
    try {
      // Try local first for fast access
      final localTransactions = await _localDataSource.getTransactions();
      if (localTransactions.isNotEmpty) {
        return localTransactions;
      }
      
      // Fallback to remote
      final List<Transaction> remoteTransactions = await _remoteDataSource.getTransactions();
      
      // Cache locally
      for (final transaction in remoteTransactions) {
        await _localDataSource.saveTransaction(transaction);
      }
      
      return remoteTransactions;
    } catch (e) {
      // If remote fails, return local data
      return await _localDataSource.getTransactions();
    }
  }
  
  @override
  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end) async {
    try {
      // Try local first
      final localTransactions = await _localDataSource.getTransactionsByDateRange(start, end);
      if (localTransactions.isNotEmpty) {
        return localTransactions;
      }
      
      // Fallback to remote
      final List<Transaction> remoteTransactions = await _remoteDataSource.getTransactionsByDateRange(start, end);
      
      // Cache locally
      for (final transaction in remoteTransactions) {
        await _localDataSource.saveTransaction(transaction);
      }
      
      return remoteTransactions;
    } catch (e) {
      return await _localDataSource.getTransactionsByDateRange(start, end);
    }
  }
  
  @override
  Future<List<Transaction>> getCurrentMonthTransactions() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    
    return await getTransactionsByDateRange(startOfMonth, endOfMonth);
  }
  
  @override
  Future<void> saveTransaction(Transaction transaction) async {
    // Save locally first for immediate access
    await _localDataSource.saveTransaction(transaction);
    
    try {
      // Sync to remote
      await _remoteDataSource.saveTransaction(transaction);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await saveTransaction(transaction);
  }
  
  @override
  Future<void> deleteTransaction(String id) async {
    await _localDataSource.deleteTransaction(id);
    
    try {
      await _remoteDataSource.deleteTransaction(id);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Stream<List<Transaction>> watchTransactions() {
    // Return local stream for immediate updates
    return _localDataSource.watchTransactions();
  }
  
  @override
  Future<List<Transaction>> getTransactionsByCategory(String categoryId) async {
    try {
      // Try local first
      final localTransactions = await _localDataSource.getTransactionsByCategory(categoryId);
      if (localTransactions.isNotEmpty) {
        return localTransactions;
      }
      
      // Fallback to remote
      final List<Transaction> remoteTransactions = await _remoteDataSource.getTransactionsByCategory(categoryId);
      return remoteTransactions;
    } catch (e) {
      return await _localDataSource.getTransactionsByCategory(categoryId);
    }
  }
}