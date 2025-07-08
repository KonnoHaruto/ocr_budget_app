import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/budget_storage_service.dart';
import '../services/budget_cache.dart';

// unawaited helper
void unawaited(Future<void> future) {
  // Intentionally ignore the future
}

class BudgetData {
  final double remainingAmount;
  final double totalBudget;
  final double spentAmount;
  final String period;

  BudgetData({
    required this.remainingAmount,
    required this.totalBudget,
    required this.spentAmount,
    this.period = '今月',
  });

  double get spentPercentage => spentAmount / totalBudget;
  double get remainingPercentage => remainingAmount / totalBudget;
}

class DailyExpense {
  final double amount;
  final DateTime date;

  DailyExpense({
    required this.amount,
    required this.date,
  });
}

// A. システム時刻レイヤ
// 端末のローカル日付が0時をまたぐたびに"今日の日付"を自動更新
final todayProvider = StreamProvider<DateTime>((ref) {
  return Stream.periodic(const Duration(minutes: 1), (_) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }).distinct();
});

// B. ドメイン状態レイヤ
// Firestore や Hive から値を取ってくる既存Provider群

class BudgetNotifier extends AsyncNotifier<BudgetData> {
  BudgetStorageService? _storageService;
  
  @override
  Future<BudgetData> build() async {
    _storageService = await BudgetStorageService.getInstance();
    return await _loadBudgetData();
  }
  
  Future<BudgetData> _loadBudgetData() async {
    if (_storageService == null) {
      return BudgetData(
        remainingAmount: 0,
        totalBudget: 0,
        spentAmount: 0,
      );
    }
    
    final data = await _storageService!.loadBudgetData();
    if (data != null) {
      return BudgetData(
        totalBudget: data['totalBudget']?.toDouble() ?? 0.0,
        spentAmount: data['spentAmount']?.toDouble() ?? 0.0,
        remainingAmount: data['remainingAmount']?.toDouble() ?? 0.0,
      );
    } else {
      // 初回起動時のデフォルト値
      return BudgetData(
        remainingAmount: 0,
        totalBudget: 0,
        spentAmount: 0,
      );
    }
  }
  
  Future<void> updateBudget({
    required double totalBudget,
    required double spentAmount,
  }) async {
    final remainingAmount = totalBudget - spentAmount;
    
    final newBudgetData = BudgetData(
      totalBudget: totalBudget,
      spentAmount: spentAmount,
      remainingAmount: remainingAmount,
    );
    
    state = AsyncValue.data(newBudgetData);
    
    // Save to local storage
    if (_storageService != null) {
      await _storageService!.saveBudgetData(
        totalBudget: totalBudget,
        spentAmount: spentAmount,
        remainingAmount: remainingAmount,
      );
    }
  }
  
  Future<void> updateTotalBudget(double totalBudget) async {
    final currentData = state.value;
    if (currentData != null) {
      await updateBudget(
        totalBudget: totalBudget,
        spentAmount: currentData.spentAmount,
      );
    }
  }
  
  Future<void> updateSpentAmount(double spentAmount) async {
    final currentData = state.value;
    if (currentData != null) {
      await updateBudget(
        totalBudget: currentData.totalBudget,
        spentAmount: spentAmount,
      );
    }
  }
  
  Future<void> resetBudget() async {
    final resetData = BudgetData(
      remainingAmount: 100000,
      totalBudget: 100000,
      spentAmount: 0,
    );
    
    state = AsyncValue.data(resetData);
    
    if (_storageService != null) {
      await _storageService!.saveBudgetData(
        totalBudget: 100000,
        spentAmount: 0,
        remainingAmount: 100000,
      );
    }
  }
}

final monthlyBudgetProvider = AsyncNotifierProvider<BudgetNotifier, BudgetData>(() {
  return BudgetNotifier();
});

// 月の支出履歴管理
class MonthlyExpensesNotifier extends StateNotifier<List<DailyExpense>> {
  BudgetStorageService? _storageService;
  
  MonthlyExpensesNotifier() : super([]) {
    _initializeStorage();
  }
  
  Future<void> _initializeStorage() async {
    _storageService = await BudgetStorageService.getInstance();
    await _loadExpenses();
  }
  
  Future<void> _loadExpenses() async {
    if (_storageService == null) return;
    
    final data = await _storageService!.loadBudgetData();
    if (data != null && data['expenses'] != null) {
      final expensesList = data['expenses'] as List;
      state = expensesList.map((expense) => DailyExpense(
        amount: expense['amount']?.toDouble() ?? 0.0,
        date: DateTime.parse(expense['date']),
      )).toList();
    }
  }
  
  Future<void> addExpense({
    required double amount,
    required String category,
    required DateTime date,
    String? description,
  }) async {
    // 支出を履歴に追加
    state = [...state, DailyExpense(amount: amount, date: date)];
    
    // 月予算の使用済み金額を更新
    final monthlyBudget = await _storageService?.loadBudgetData();
    if (monthlyBudget != null) {
      final totalSpent = state.fold<double>(0.0, (sum, expense) => sum + expense.amount);
      final totalBudget = monthlyBudget['totalBudget']?.toDouble() ?? 100000.0;
      
      await _storageService?.saveBudgetData(
        totalBudget: totalBudget,
        spentAmount: totalSpent,
        remainingAmount: totalBudget - totalSpent,
      );
    }
    
    await _saveExpenses();
  }
  
  Future<void> _saveExpenses() async {
    if (_storageService == null) return;
    
    final expensesData = state.map((expense) => {
      'amount': expense.amount,
      'date': expense.date.toIso8601String(),
    }).toList();
    
    final currentData = await _storageService!.loadBudgetData() ?? {};
    currentData['expenses'] = expensesData;
    
    await _storageService!.saveBudgetData(
      totalBudget: currentData['totalBudget']?.toDouble() ?? 100000.0,
      spentAmount: currentData['spentAmount']?.toDouble() ?? 0.0,
      remainingAmount: currentData['remainingAmount']?.toDouble() ?? 100000.0,
    );
  }
  
  // 今日の支出を取得
  double getTodaySpent(DateTime today) {
    return state
        .where((expense) {
          final expenseDate = DateTime(expense.date.year, expense.date.month, expense.date.day);
          return expenseDate.isAtSameMomentAs(today);
        })
        .fold<double>(0.0, (sum, expense) => sum + expense.amount);
  }
}

final monthlyExpensesProvider = StateNotifierProvider<MonthlyExpensesNotifier, List<DailyExpense>>((ref) {
  return MonthlyExpensesNotifier();
});

// C. 派生計算レイヤ
// 今日残っている金額を そのつど算出 = 残額/残り日数

final todayBudgetProvider = Provider<double>((ref) {
  final today = ref.watch(todayProvider).value;
  final monthlyBudgetAsync = ref.watch(monthlyBudgetProvider);
  
  if (today == null) return 0.0;
  
  // AsyncValueを適切に処理
  return monthlyBudgetAsync.when(
    data: (budget) {
      final daysRemaining = _getDaysRemainingInMonth(today);
      return daysRemaining > 0 ? budget.remainingAmount / daysRemaining : 0.0;
    },
    loading: () => 0.0,
    error: (error, stackTrace) => 0.0,
  );
});

final todaySpentProvider = Provider<double>((ref) {
  final today = ref.watch(todayProvider).value;
  final expensesNotifier = ref.read(monthlyExpensesProvider.notifier);
  
  if (today == null) return 0.0;
  
  return expensesNotifier.getTodaySpent(today);
});

final todayRemainingProvider = Provider<double>((ref) {
  final todayBudget = ref.watch(todayBudgetProvider);
  final todaySpent = ref.watch(todaySpentProvider);
  
  return todayBudget - todaySpent;
});

// レガシー互換性のためのプロバイダー
final budgetProvider = Provider<BudgetData>((ref) {
  final monthlyBudgetAsync = ref.watch(monthlyBudgetProvider);
  
  return monthlyBudgetAsync.when(
    data: (budget) => budget,
    loading: () => BudgetData(
      remainingAmount: 0,
      totalBudget: 0,
      spentAmount: 0,
    ),
    error: (error, stackTrace) => BudgetData(
      remainingAmount: 0,
      totalBudget: 0,
      spentAmount: 0,
    ),
  );
});

class DailyBudgetData {
  final double dailyBudget;
  final double todaySpent;
  final double remainingToday;
  final int daysRemaining;
  final DateTime today;

  DailyBudgetData({
    required this.dailyBudget,
    required this.todaySpent,
    required this.remainingToday,
    required this.daysRemaining,
    required this.today,
  });

  double get todaySpentPercentage => dailyBudget > 0 ? todaySpent / dailyBudget : 0.0;
  double get remainingTodayPercentage => dailyBudget > 0 ? remainingToday / dailyBudget : 0.0;
}

// DailyBudgetCtrl for Hydrated Riverpod pattern
class DailyBudgetCtrl extends AsyncNotifier<DailyBudget> {
  @override
  Future<DailyBudget> build() async {
    // 1. キャッシュを即座に emit
    final cached = BudgetCache.load();
    if (cached != null) {
      state = AsyncData(cached);
    }
    
    // 2. 正規計算 (Firestore/Hive 集計など)
    final result = await _recompute();
    
    // 3. キャッシュ更新
    unawaited(BudgetCache.save(result));
    
    return result;
  }
  
  Future<DailyBudget> _recompute() async {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    
    // 月予算データを取得
    final monthlyBudgetAsync = ref.read(monthlyBudgetProvider);
    final monthlyBudget = monthlyBudgetAsync.value;
    
    if (monthlyBudget == null) {
      return DailyBudget(
        dailyBudget: 0.0,
        todaySpent: 0.0,
        remainingToday: 0.0,
        daysRemaining: 0,
        today: todayOnly,
      );
    }
    
    // 残り日数を計算
    final daysRemaining = _getDaysRemainingInMonth(todayOnly);
    
    // 今日の予算 = 残り予算 / 残り日数
    final dailyBudget = daysRemaining > 0 ? monthlyBudget.remainingAmount / daysRemaining : 0.0;
    
    // 今日の支出を取得
    final expensesNotifier = ref.read(monthlyExpensesProvider.notifier);
    final todaySpent = expensesNotifier.getTodaySpent(todayOnly);
    
    // 今日の残り予算
    final remainingToday = dailyBudget - todaySpent;
    
    return DailyBudget(
      dailyBudget: dailyBudget,
      todaySpent: todaySpent,
      remainingToday: remainingToday,
      daysRemaining: daysRemaining,
      today: todayOnly,
    );
  }
  
  // 外部から再計算をトリガー
  Future<void> refresh() async {
    state = const AsyncLoading();
    final result = await _recompute();
    unawaited(BudgetCache.save(result));
    state = AsyncData(result);
  }
}

final dailyBudgetProvider = AsyncNotifierProvider<DailyBudgetCtrl, DailyBudget>(() {
  return DailyBudgetCtrl();
});

// レガシー互換性のためのプロバイダー
final dailyBudgetDataProvider = Provider<DailyBudgetData>((ref) {
  final dailyBudgetAsync = ref.watch(dailyBudgetProvider);
  
  return dailyBudgetAsync.when(
    data: (dailyBudget) => DailyBudgetData(
      dailyBudget: dailyBudget.dailyBudget,
      todaySpent: dailyBudget.todaySpent,
      remainingToday: dailyBudget.remainingToday,
      daysRemaining: dailyBudget.daysRemaining,
      today: dailyBudget.today,
    ),
    loading: () => DailyBudgetData(
      dailyBudget: 0.0,
      todaySpent: 0.0,
      remainingToday: 0.0,
      daysRemaining: 0,
      today: DateTime.now(),
    ),
    error: (error, stackTrace) => DailyBudgetData(
      dailyBudget: 0.0,
      todaySpent: 0.0,
      remainingToday: 0.0,
      daysRemaining: 0,
      today: DateTime.now(),
    ),
  );
});

// 支出追加のためのヘルパープロバイダー
final addExpenseProvider = Provider<Future<void> Function({
  required double amount,
  required String category,
  required DateTime date,
  String? description,
})>((ref) {
  return ({
    required double amount,
    required String category,
    required DateTime date,
    String? description,
  }) async {
    // 月の支出履歴に追加
    await ref.read(monthlyExpensesProvider.notifier).addExpense(
      amount: amount,
      category: category,
      date: date,
      description: description,
    );
    
    // 月予算を更新
    final expenses = ref.read(monthlyExpensesProvider);
    final totalSpent = expenses.fold<double>(0.0, (sum, expense) => sum + expense.amount);
    final currentBudgetAsync = ref.read(monthlyBudgetProvider);
    
    if (currentBudgetAsync.hasValue) {
      final currentBudget = currentBudgetAsync.value!;
      await ref.read(monthlyBudgetProvider.notifier).updateBudget(
        totalBudget: currentBudget.totalBudget,
        spentAmount: totalSpent,
      );
    }
  };
});

int _getDaysRemainingInMonth(DateTime date) {
  final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
  final daysRemaining = lastDayOfMonth.day - date.day + 1; // 今日を含む
  return daysRemaining > 0 ? daysRemaining : 1; // 最低1日は保証
}

// アニメーションプロバイダー（未使用のDailyBudgetCard用に保持）
final monthlyProgressAnimationProvider = StateProvider<double>((ref) => 1.0);
final dailyProgressAnimationProvider = StateProvider<double>((ref) => 1.0);