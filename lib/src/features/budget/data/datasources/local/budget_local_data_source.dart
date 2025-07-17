import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/budget.dart';

class BudgetLocalDataSource {
  static const String _boxName = 'budget_box';
  static const String _budgetKey = 'current_budget';
  
  late Box<Map<dynamic, dynamic>> _box;
  
  Future<void> init() async {
    _box = await Hive.openBox<Map<dynamic, dynamic>>(_boxName);
  }
  
  Future<Budget?> getCurrentBudget() async {
    final budgetMap = _box.get(_budgetKey);
    if (budgetMap == null) return null;
    
    return Budget.fromJson(Map<String, dynamic>.from(budgetMap));
  }
  
  Future<void> saveBudget(Budget budget) async {
    await _box.put(_budgetKey, budget.toJson());
  }
  
  Future<void> deleteBudget() async {
    await _box.delete(_budgetKey);
  }
  
  Stream<Budget?> watchBudget() {
    return _box.watch(key: _budgetKey).map((event) {
      if (event.value == null) return null;
      return Budget.fromJson(Map<String, dynamic>.from(event.value));
    });
  }
}