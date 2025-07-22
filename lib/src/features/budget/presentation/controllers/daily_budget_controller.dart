import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/daily_budget.dart';
import 'budget_controller.dart';
import 'transaction_controller.dart';

class DailyBudgetController extends AsyncNotifier<DailyBudget?> {
  static const _boxName = 'daily_budget_box';

  late Box<Map<dynamic, dynamic>> _box;

  @override
  Future<DailyBudget?> build() async {
    _box = await Hive.openBox<Map<dynamic, dynamic>>(_boxName);
    
    // Watch for transaction changes to trigger recalculation
    ref.watch(transactionControllerProvider);

    final today = DateTime.now();
    
    // Always recalculate for today to ensure fresh data after transactions
    return _calculateDailyBudget(today);
  }

  Future<DailyBudget?> _calculateDailyBudget(DateTime date) async {
    final budget = await ref.read(budgetControllerProvider.future);
    if (budget == null) return null;

    final transactions = await ref.read(transactionControllerProvider.future);

    final startOfMonth = DateTime(date.year, date.month, 1);
    final yesterday = date.subtract(const Duration(days: 1));

    final spent = transactions
        .where((t) =>
            !t.date.isBefore(startOfMonth) && !t.date.isAfter(yesterday))
        .fold<double>(0, (sum, t) => sum + t.amount);

    final monthEnd = DateTime(date.year, date.month, budget.monthEndDay);
    final adjMonthEnd =
        monthEnd.isBefore(date) ? monthEnd.add(const Duration(days: 31)) : monthEnd;
    final daysLeft = adjMonthEnd.difference(date).inDays + 1;

    final todayAmount =
        daysLeft > 0 ? (budget.monthlyBudget - spent) / daysLeft : 0.0;

    final daily = DailyBudget(
      date: date,
      amount: todayAmount.clamp(0.0, double.infinity),
      calculatedAt: DateTime.now(),
    );

    await _box.put(_formatDateKey(date), daily.toJson());
    return daily;
  }

  String _formatDateKey(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

final dailyBudgetControllerProvider = AsyncNotifierProvider<DailyBudgetController, DailyBudget?>(
  () => DailyBudgetController(),
);