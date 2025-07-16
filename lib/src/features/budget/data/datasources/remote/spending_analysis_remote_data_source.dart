import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/spending_analysis.dart';
import '../../../domain/analysis_type.dart';

class SpendingAnalysisRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  
  SpendingAnalysisRemoteDataSource(this._firestore, this._auth);
  
  String get _userId => _auth.currentUser?.uid ?? '';
  
  CollectionReference get _analysisCollection => 
      _firestore.collection('users').doc(_userId).collection('spending_analyses');
  
  Future<SpendingAnalysis?> getAnalysis(
    AnalysisType type,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final querySnapshot = await _analysisCollection
          .where('type', isEqualTo: type.name)
          .where('startDate', isEqualTo: Timestamp.fromDate(startDate))
          .where('endDate', isEqualTo: Timestamp.fromDate(endDate))
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isEmpty) return null;
      
      final doc = querySnapshot.docs.first;
      return SpendingAnalysis.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch spending analysis: $e');
    }
  }
  
  Future<void> saveAnalysis(SpendingAnalysis analysis) async {
    try {
      await _analysisCollection.doc(analysis.id).set(analysis.toJson());
    } catch (e) {
      throw Exception('Failed to save spending analysis: $e');
    }
  }
  
  Future<List<SpendingAnalysis>> getRecentAnalyses({int limit = 10}) async {
    try {
      final querySnapshot = await _analysisCollection
          .orderBy('createdAt', descending: true)
          .limit(limit)
          .get();
      
      return querySnapshot.docs
          .map((doc) => SpendingAnalysis.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch recent analyses: $e');
    }
  }
  
  Future<void> deleteOldAnalyses(DateTime cutoffDate) async {
    try {
      final querySnapshot = await _analysisCollection
          .where('createdAt', isLessThan: Timestamp.fromDate(cutoffDate))
          .get();
      
      final batch = _firestore.batch();
      for (final doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }
      
      await batch.commit();
    } catch (e) {
      throw Exception('Failed to delete old analyses: $e');
    }
  }
  
  Stream<List<SpendingAnalysis>> watchAnalyses() {
    return _analysisCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => SpendingAnalysis.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}