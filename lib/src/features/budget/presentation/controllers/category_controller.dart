import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/category.dart';
import '../../../../shared/providers/repository_providers.dart';
import 'package:uuid/uuid.dart';

class CategoryController extends AsyncNotifier<List<Category>> {
  @override
  Future<List<Category>> build() async {
    final repository = ref.watch(categoryRepositoryProvider);
    return await repository.getCategories();
  }

  Future<void> addCategory({
    required String name,
    required String colorHex,
    required String iconName,
    required List<String> keywords,
    bool isDefault = false,
  }) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final category = Category(
        id: const Uuid().v4(),
        name: name,
        colorHex: colorHex,
        iconName: iconName,
        keywords: keywords,
        isDefault: isDefault,
        createdAt: DateTime.now(),
      );
      
      await repository.saveCategory(category);
      
      // Refresh the category list
      final updatedCategories = await repository.getCategories();
      state = AsyncValue.data(updatedCategories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateCategory(Category category) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(categoryRepositoryProvider);
      await repository.updateCategory(category);
      
      // Refresh the category list
      final updatedCategories = await repository.getCategories();
      state = AsyncValue.data(updatedCategories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(categoryRepositoryProvider);
      await repository.deleteCategory(categoryId);
      
      // Refresh the category list
      final updatedCategories = await repository.getCategories();
      state = AsyncValue.data(updatedCategories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> initializeDefaultCategories() async {
    state = const AsyncLoading();
    
    try {
      final repository = ref.read(categoryRepositoryProvider);
      final existingCategories = await repository.getCategories();
      
      if (existingCategories.isEmpty) {
        // Create default categories
        final defaultCategories = [
          Category(
            id: const Uuid().v4(),
            name: 'Food',
            colorHex: '#FF6B6B',
            iconName: 'restaurant',
            keywords: ['food', 'restaurant', 'lunch', 'dinner', 'breakfast', 'cafe'],
            isDefault: true,
            createdAt: DateTime.now(),
          ),
          Category(
            id: const Uuid().v4(),
            name: 'Transportation',
            colorHex: '#4ECDC4',
            iconName: 'directions_car',
            keywords: ['transport', 'bus', 'train', 'taxi', 'gas', 'fuel'],
            isDefault: true,
            createdAt: DateTime.now(),
          ),
          Category(
            id: const Uuid().v4(),
            name: 'Shopping',
            colorHex: '#45B7D1',
            iconName: 'shopping_bag',
            keywords: ['shopping', 'clothes', 'retail', 'store', 'mall'],
            isDefault: true,
            createdAt: DateTime.now(),
          ),
          Category(
            id: const Uuid().v4(),
            name: 'Entertainment',
            colorHex: '#F7DC6F',
            iconName: 'movie',
            keywords: ['entertainment', 'movie', 'game', 'music', 'concert'],
            isDefault: true,
            createdAt: DateTime.now(),
          ),
          Category(
            id: const Uuid().v4(),
            name: 'Other',
            colorHex: '#BB8FCE',
            iconName: 'category',
            keywords: ['other', 'misc', 'miscellaneous'],
            isDefault: true,
            createdAt: DateTime.now(),
          ),
        ];
        
        for (final category in defaultCategories) {
          await repository.saveCategory(category);
        }
      }
      
      final updatedCategories = await repository.getCategories();
      state = AsyncValue.data(updatedCategories);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final categoryControllerProvider = AsyncNotifierProvider<CategoryController, List<Category>>(
  () => CategoryController(),
);