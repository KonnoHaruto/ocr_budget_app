import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/category.dart';

class CategoryRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  
  CategoryRemoteDataSource(this._firestore, this._auth);
  
  String get _userId => _auth.currentUser?.uid ?? '';
  
  CollectionReference get _categoryCollection => 
      _firestore.collection('users').doc(_userId).collection('categories');
  
  Future<List<Category>> getCategories() async {
    try {
      final querySnapshot = await _categoryCollection
          .orderBy('createdAt', descending: false)
          .get();
      
      return querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
  
  Future<void> saveCategory(Category category) async {
    try {
      await _categoryCollection.doc(category.id).set(category.toJson());
    } catch (e) {
      throw Exception('Failed to save category: $e');
    }
  }
  
  Future<void> deleteCategory(String id) async {
    try {
      await _categoryCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete category: $e');
    }
  }
  
  Future<Category?> getCategoryById(String id) async {
    try {
      final doc = await _categoryCollection.doc(id).get();
      if (!doc.exists) return null;
      
      return Category.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch category: $e');
    }
  }
  
  Stream<List<Category>> watchCategories() {
    return _categoryCollection
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }
}