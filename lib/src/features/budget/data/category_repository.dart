import '../domain/category.dart';

abstract class CategoryRepository {
  /// Get all categories
  Future<List<Category>> getCategories();
  
  /// Get default categories
  Future<List<Category>> getDefaultCategories();
  
  /// Save a new category
  Future<void> saveCategory(Category category);
  
  /// Update existing category
  Future<void> updateCategory(Category category);
  
  /// Delete category
  Future<void> deleteCategory(String id);
  
  /// Get category by ID
  Future<Category?> getCategoryById(String id);
  
  /// Stream of categories
  Stream<List<Category>> watchCategories();
  
  /// Find category by keywords (for AI categorization)
  Future<Category?> findCategoryByKeywords(List<String> keywords);
}