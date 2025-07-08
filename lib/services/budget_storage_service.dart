import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetStorageService {
  static const String _budgetKey = 'budget_data';
  
  static BudgetStorageService? _instance;
  SharedPreferences? _prefs;
  
  BudgetStorageService._();
  
  static Future<BudgetStorageService> getInstance() async {
    _instance ??= BudgetStorageService._();
    _instance!._prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }
  
  Future<Map<String, dynamic>?> loadBudgetData() async {
    try {
      final String? data = _prefs?.getString(_budgetKey);
      if (data != null) {
        return json.decode(data) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      debugPrint('Error loading budget data: $e');
      return null;
    }
  }
  
  Future<bool> saveBudgetData({
    required double totalBudget,
    required double spentAmount,
    required double remainingAmount,
    double? todaySpent,
    String? lastResetDate,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'totalBudget': totalBudget,
        'spentAmount': spentAmount,
        'remainingAmount': remainingAmount,
        'lastUpdated': DateTime.now().toIso8601String(),
      };
      
      if (todaySpent != null) {
        data['todaySpent'] = todaySpent;
      }
      if (lastResetDate != null) {
        data['lastResetDate'] = lastResetDate;
      }
      
      final String jsonData = json.encode(data);
      return await _prefs?.setString(_budgetKey, jsonData) ?? false;
    } catch (e) {
      debugPrint('Error saving budget data: $e');
      return false;
    }
  }
  
  Future<bool> clearBudgetData() async {
    try {
      return await _prefs?.remove(_budgetKey) ?? false;
    } catch (e) {
      debugPrint('Error clearing budget data: $e');
      return false;
    }
  }
}