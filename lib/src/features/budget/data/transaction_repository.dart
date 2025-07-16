import '../domain/transaction.dart';

abstract class TransactionRepository {
  /// Get all transactions
  Future<List<Transaction>> getTransactions();
  
  /// Get transactions for a specific date range
  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end);
  
  /// Get transactions for current month
  Future<List<Transaction>> getCurrentMonthTransactions();
  
  /// Save a new transaction
  Future<void> saveTransaction(Transaction transaction);
  
  /// Update existing transaction
  Future<void> updateTransaction(Transaction transaction);
  
  /// Delete transaction
  Future<void> deleteTransaction(String id);
  
  /// Stream of transactions
  Stream<List<Transaction>> watchTransactions();
  
  /// Get transactions by category
  Future<List<Transaction>> getTransactionsByCategory(String categoryId);
}