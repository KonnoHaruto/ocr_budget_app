import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/budget_storage_service.dart';
import '../services/budget_cache.dart';


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

  double get spentPercentage => totalBudget > 0 ? spentAmount / totalBudget : 0.0;
  double get remainingPercentage => totalBudget > 0 ? remainingAmount / totalBudget : 0.0;
}

class DailyExpense {
  final double amount;
  final DateTime date;

  DailyExpense({
    required this.amount,
    required this.date,
  });
}


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
      // 初回起動時のデフォルト値（オンボーディングで設定されるまで0）
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
    } else {
      // 初回設定時はstateがnullの可能性があるため、デフォルト値で初期化
      await updateBudget(
        totalBudget: totalBudget,
        spentAmount: 0,
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





// DailyBudgetCtrl for Hydrated Riverpod pattern
class DailyBudgetCtrl extends AsyncNotifier<DailyBudget> {
  @override
  Future<DailyBudget> build() async {
    try {
      // 1. キャッシュを即座に emit
      final cached = BudgetCache.load();
      if (cached != null) {
        state = AsyncData(cached);
      }
      
      // 2. 正規計算 (Firestore/Hive 集計など)
      final result = await _recompute();
      
      // 3. キャッシュ更新
      // ignore: unawaited_futures
      BudgetCache.save(result);
      
      return result;
    } catch (e, _) {
      // エラー時にはデフォルト値を返す
      print('DailyBudgetCtrl build error: $e');
      final today = DateTime.now();
      final todayOnly = DateTime(today.year, today.month, today.day);
      
      final defaultBudget = DailyBudget(
        dailyBudget: 0.0,
        todaySpent: 0.0,
        remainingToday: 0.0,
        daysRemaining: _getDaysRemainingInMonth(todayOnly),
        today: todayOnly,
      );
      
      return defaultBudget;
    }
  }
  
  Future<DailyBudget> _recompute() async {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    
    // 月予算データを非同期で取得
    final monthlyBudgetAsync = ref.read(monthlyBudgetProvider);
    
    // まだロード中の場合は待機
    final monthlyBudget = await monthlyBudgetAsync.when(
      data: (budget) async => budget,
      loading: () async {
        // ロード中の場合は、完了まで待機
        final completer = ref.read(monthlyBudgetProvider.future);
        return await completer;
      },
      error: (error, stackTrace) async {
        // エラーの場合はデフォルト値を返す
        return BudgetData(
          remainingAmount: 100000,
          totalBudget: 100000,
          spentAmount: 0,
        );
      },
    );
    
    if (monthlyBudget.totalBudget == 0) {
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
    // ignore: unawaited_futures
    BudgetCache.save(result);
    state = AsyncData(result);
  }
}

final dailyBudgetProvider = AsyncNotifierProvider<DailyBudgetCtrl, DailyBudget>(() {
  return DailyBudgetCtrl();
});



int _getDaysRemainingInMonth(DateTime date) {
  final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
  final daysRemaining = lastDayOfMonth.day - date.day + 1; // 今日を含む
  return daysRemaining > 0 ? daysRemaining : 1; // 最低1日は保証
}

