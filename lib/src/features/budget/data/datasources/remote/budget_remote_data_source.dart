import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/budget.dart';

class BudgetRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  
  BudgetRemoteDataSource(this._firestore, this._auth);
  
  String get _userId => _auth.currentUser?.uid ?? '';
  
  CollectionReference get _budgetCollection => 
      _firestore.collection('users').doc(_userId).collection('budgets');
  
  Future<Budget?> getCurrentBudget() async {
    try {
      final querySnapshot = await _budgetCollection
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isEmpty) return null;
      
      final doc = querySnapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;
      return Budget.fromJson(data);
    } catch (e) {
      throw Exception('Failed to fetch budget: $e');
    }
  }
  
  Future<void> saveBudget(Budget budget) async {
    try {
      await _budgetCollection.doc(budget.id).set(budget.toJson());
    } catch (e) {
      throw Exception('Failed to save budget: $e');
    }
  }
  
  Future<void> deleteBudget(String id) async {
    try {
      await _budgetCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete budget: $e');
    }
  }
  
  Stream<Budget?> watchBudget() {
    return _budgetCollection
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) return null;
      
      final doc = snapshot.docs.first;
      final data = doc.data() as Map<String, dynamic>;
      return Budget.fromJson(data);
    });
  }
}