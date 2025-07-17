import '../category_repository.dart';
import '../datasources/local/category_local_data_source.dart';
import '../datasources/remote/category_remote_data_source.dart';
import '../../domain/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;
  final CategoryRemoteDataSource _remoteDataSource;
  
  CategoryRepositoryImpl(this._localDataSource, this._remoteDataSource);
  
  @override
  Future<List<Category>> getCategories() async {
    try {
      // Try local first for fast access
      final localCategories = await _localDataSource.getCategories();
      if (localCategories.isNotEmpty) {
        return localCategories;
      }
      
      // Fallback to remote
      final remoteCategories = await _remoteDataSource.getCategories();
      
      // Cache locally
      for (final category in remoteCategories) {
        await _localDataSource.saveCategory(category);
      }
      
      return remoteCategories;
    } catch (e) {
      // If remote fails, return local data
      return await _localDataSource.getCategories();
    }
  }
  
  @override
  Future<List<Category>> getDefaultCategories() async {
    final categories = await getCategories();
    return categories.where((category) => category.isDefault).toList();
  }
  
  @override
  Future<void> saveCategory(Category category) async {
    // Save locally first for immediate access
    await _localDataSource.saveCategory(category);
    
    try {
      // Sync to remote
      await _remoteDataSource.saveCategory(category);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Future<void> updateCategory(Category category) async {
    await saveCategory(category);
  }
  
  @override
  Future<void> deleteCategory(String id) async {
    await _localDataSource.deleteCategory(id);
    
    try {
      await _remoteDataSource.deleteCategory(id);
    } catch (e) {
      // Log error but don't fail the operation
    }
  }
  
  @override
  Future<Category?> getCategoryById(String id) async {
    try {
      // Try local first
      final localCategory = await _localDataSource.getCategoryById(id);
      if (localCategory != null) {
        return localCategory;
      }
      
      // Fallback to remote
      final remoteCategory = await _remoteDataSource.getCategoryById(id);
      if (remoteCategory != null) {
        // Cache locally
        await _localDataSource.saveCategory(remoteCategory);
        return remoteCategory;
      }
      
      return null;
    } catch (e) {
      return await _localDataSource.getCategoryById(id);
    }
  }
  
  @override
  Stream<List<Category>> watchCategories() {
    // Return local stream for immediate updates
    return _localDataSource.watchCategories();
  }
  
  @override
  Future<Category?> findCategoryByKeywords(List<String> keywords) async {
    // This is primarily used for AI categorization, so use local data for speed
    return await _localDataSource.findCategoryByKeywords(keywords);
  }
}