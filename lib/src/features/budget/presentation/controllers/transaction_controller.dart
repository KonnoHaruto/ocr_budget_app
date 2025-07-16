import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/transaction.dart';
import '../../domain/transaction_input_method.dart';
import '../../domain/receipt_item.dart';
import '../../../../shared/providers/repository_providers.dart';
import 'package:uuid/uuid.dart';

class TransactionController extends AsyncNotifier<List<Transaction>> {
  @override
  Future<List<Transaction>> build() async {
    final repository = ref.watch(transactionRepositoryProvider);
    return await repository.getTransactions();
  }

  Future<void> addTransaction({
    required double amount,
    required String description,
    required TransactionInputMethod inputMethod,
    String? categoryId,
    List<ReceiptItem>? receiptItems,
    String? receiptImagePath,
    double? aiConfidenceScore,
  }) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(transactionRepositoryProvider);
      final transaction = Transaction(
        id: const Uuid().v4(),
        amount: amount,
        description: description,
        date: DateTime.now(),
        inputMethod: inputMethod,
        categoryId: categoryId,
        receiptItems: receiptItems ?? [],
        receiptImagePath: receiptImagePath,
        aiConfidenceScore: aiConfidenceScore,
      );
      
      await repository.saveTransaction(transaction);
      
      // Refresh the transaction list
      final updatedTransactions = await repository.getTransactions();
      state = AsyncValue.data(updatedTransactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateTransaction(Transaction transaction) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(transactionRepositoryProvider);
      await repository.updateTransaction(transaction);
      
      // Refresh the transaction list
      final updatedTransactions = await repository.getTransactions();
      state = AsyncValue.data(updatedTransactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(transactionRepositoryProvider);
      await repository.deleteTransaction(transactionId);
      
      // Refresh the transaction list
      final updatedTransactions = await repository.getTransactions();
      state = AsyncValue.data(updatedTransactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refreshTransactions() async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(transactionRepositoryProvider);
      final transactions = await repository.getTransactions();
      state = AsyncValue.data(transactions);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final transactionControllerProvider = AsyncNotifierProvider<TransactionController, List<Transaction>>(
  () => TransactionController(),
);

// Current month transactions provider
final currentMonthTransactionsProvider = FutureProvider<List<Transaction>>((ref) async {
  final repository = ref.watch(transactionRepositoryProvider);
  return await repository.getCurrentMonthTransactions();
});