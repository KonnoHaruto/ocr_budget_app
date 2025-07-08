import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DailyBudget {
  final double dailyBudget;
  final double todaySpent;
  final double remainingToday;
  final int daysRemaining;
  final DateTime today;

  DailyBudget({
    required this.dailyBudget,
    required this.todaySpent,
    required this.remainingToday,
    required this.daysRemaining,
    required this.today,
  });

  double get todaySpentPercentage => dailyBudget > 0 ? todaySpent / dailyBudget : 0.0;
  double get remainingTodayPercentage => dailyBudget > 0 ? remainingToday / dailyBudget : 0.0;

  Map<String, dynamic> toJson() {
    return {
      'dailyBudget': dailyBudget,
      'todaySpent': todaySpent,
      'remainingToday': remainingToday,
      'daysRemaining': daysRemaining,
      'today': today.toIso8601String(),
    };
  }

  factory DailyBudget.fromJson(Map<String, dynamic> map) {
    return DailyBudget(
      dailyBudget: map['dailyBudget']?.toDouble() ?? 0.0,
      todaySpent: map['todaySpent']?.toDouble() ?? 0.0,
      remainingToday: map['remainingToday']?.toDouble() ?? 0.0,
      daysRemaining: map['daysRemaining']?.toInt() ?? 0,
      today: DateTime.parse(map['today'] ?? DateTime.now().toIso8601String()),
    );
  }
}

class BudgetCache {
  static const _kKey = 'cached_daily_budget';
  
  static DailyBudget? load() {
    try {
      // 同期的にSharedPreferencesを取得することはできないため、
      // 実際の実装ではここでキャッシュ済みの値を返すか、nullを返す
      return null;
    } catch (e) {
      return null;
    }
  }
  
  static Future<void> save(DailyBudget data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kKey, json.encode(data.toJson()));
    } catch (e) {
      // エラーログを出力
      print('Failed to save budget cache: $e');
    }
  }
  
  static Future<DailyBudget?> loadAsync() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final dataString = prefs.getString(_kKey);
      if (dataString != null) {
        final map = json.decode(dataString) as Map<String, dynamic>;
        return DailyBudget.fromJson(map);
      }
      return null;
    } catch (e) {
      print('Failed to load budget cache: $e');
      return null;
    }
  }
}