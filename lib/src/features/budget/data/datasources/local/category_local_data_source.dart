import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/category.dart';

class CategoryLocalDataSource {
  static const String _boxName = 'category_box';
  
  late Box<Map<dynamic, dynamic>> _box;
  
  Future<void> init() async {
    _box = await Hive.openBox<Map<dynamic, dynamic>>(_boxName);
  }
  
  Future<List<Category>> getCategories() async {
    final categoryMaps = _box.values.toList();
    return categoryMaps
        .map((map) => Category.fromJson(Map<String, dynamic>.from(map)))
        .toList();
  }
  
  Future<void> saveCategory(Category category) async {
    await _box.put(category.id, category.toJson());
  }
  
  Future<void> deleteCategory(String id) async {
    await _box.delete(id);
  }
  
  Future<Category?> getCategoryById(String id) async {
    final categoryMap = _box.get(id);
    if (categoryMap == null) return null;
    
    return Category.fromJson(Map<String, dynamic>.from(categoryMap));
  }
  
  Stream<List<Category>> watchCategories() {
    return _box.watch().map((event) {
      final categoryMaps = _box.values.toList();
      return categoryMaps
          .map((map) => Category.fromJson(Map<String, dynamic>.from(map)))
          .toList();
    });
  }
  
  Future<Category?> findCategoryByKeywords(List<String> keywords) async {
    final categories = await getCategories();
    
    for (final category in categories) {
      for (final keyword in keywords) {
        if (category.keywords.any((k) => k.toLowerCase().contains(keyword.toLowerCase()))) {
          return category;
        }
      }
    }
    
    return null;
  }
}