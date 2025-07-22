import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/transaction.dart';

class TransactionLocalDataSource {
  static const String _boxName = 'transaction_box';
  
  late Box<Map<dynamic, dynamic>> _box;
  
  Future<void> init() async {
    _box = await Hive.openBox<Map<dynamic, dynamic>>(_boxName);
    debugPrint('DEBUG: Transaction Hive box initialized successfully');
  }
  
  Future<List<Transaction>> getTransactions() async {
    final transactionMaps = _box.values.toList();
    return transactionMaps
        .map((map) => Transaction.fromJson(Map<String, dynamic>.from(map)))
        .toList();
  }
  
  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end) async {
    final transactions = await getTransactions();
    return transactions.where((transaction) {
      return transaction.date.isAfter(start.subtract(const Duration(days: 1))) &&
             transaction.date.isBefore(end.add(const Duration(days: 1)));
    }).toList();
  }
  
  Future<void> saveTransaction(Transaction transaction) async {
    await _box.put(transaction.id, transaction.toJson());
  }
  
  Future<void> deleteTransaction(String id) async {
    await _box.delete(id);
  }
  
  Stream<List<Transaction>> watchTransactions() {
    return _box.watch().map((event) {
      final transactionMaps = _box.values.toList();
      return transactionMaps
          .map((map) => Transaction.fromJson(Map<String, dynamic>.from(map)))
          .toList();
    });
  }
  
  Future<List<Transaction>> getTransactionsByCategory(String categoryId) async {
    final transactions = await getTransactions();
    return transactions.where((transaction) => transaction.categoryId == categoryId).toList();
  }
}