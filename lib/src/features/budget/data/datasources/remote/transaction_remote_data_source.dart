import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/transaction.dart' as domain;

class TransactionRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  
  TransactionRemoteDataSource(this._firestore, this._auth);
  
  String get _userId => _auth.currentUser?.uid ?? '';
  
  CollectionReference get _transactionCollection => 
      _firestore.collection('users').doc(_userId).collection('transactions');
  
  Future<List<domain.Transaction>> getTransactions() async {
    try {
      final querySnapshot = await _transactionCollection
          .orderBy('date', descending: true)
          .get();
      
      return querySnapshot.docs
          .map((doc) => domain.Transaction.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions: $e');
    }
  }
  
  Future<List<domain.Transaction>> getTransactionsByDateRange(DateTime start, DateTime end) async {
    try {
      final querySnapshot = await _transactionCollection
          .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(start))
          .where('date', isLessThanOrEqualTo: Timestamp.fromDate(end))
          .orderBy('date', descending: true)
          .get();
      
      return querySnapshot.docs
          .map((doc) => domain.Transaction.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions by date range: $e');
    }
  }
  
  Future<void> saveTransaction(domain.Transaction transaction) async {
    try {
      await _transactionCollection.doc(transaction.id).set(transaction.toJson());
    } catch (e) {
      throw Exception('Failed to save transaction: $e');
    }
  }
  
  Future<void> deleteTransaction(String id) async {
    try {
      await _transactionCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }
  
  Stream<List<domain.Transaction>> watchTransactions() {
    return _transactionCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => domain.Transaction.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
  
  Future<List<domain.Transaction>> getTransactionsByCategory(String categoryId) async {
    try {
      final querySnapshot = await _transactionCollection
          .where('categoryId', isEqualTo: categoryId)
          .orderBy('date', descending: true)
          .get();
      
      return querySnapshot.docs
          .map((doc) => domain.Transaction.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch transactions by category: $e');
    }
  }
}