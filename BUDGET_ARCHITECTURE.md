# OCR Budget App - 予算管理アーキテクチャ

## 概要

このドキュメントでは、OCR Budget Appの予算管理システムのアーキテクチャ、データフロー、およびプロバイダーの依存関係について説明します。

## 1. 日別予算計算ロジック

### 核心となる計算式

```dart
// 基本計算（DailyBudgetCtrl._recompute()内）
final dailyBudget = daysRemaining > 0 ? monthlyBudget.remainingAmount / daysRemaining : 0.0;
final todayRemaining = dailyBudget - todaySpent;
```

### 計算の詳細プロセス

1. **月間予算データの取得**
   - 総予算額 (`totalBudget`)
   - 今月の使用済み金額 (`spentAmount`)
   - 残り予算 (`remainingAmount = totalBudget - spentAmount`)

2. **残り日数の計算**
   ```dart
   final daysRemaining = lastDayOfMonth.day - today.day + 1; // 今日を含む
   ```

3. **1日の予算計算**
   ```dart
   dailyBudget = 残り予算 ÷ 残り日数
   ```

4. **今日の支出計算**
   - 支出履歴から今日の日付でフィルタリング
   - 該当する支出の合計金額を算出

5. **今日の残り予算**
   ```dart
   todayRemaining = dailyBudget - todaySpent
   ```

## 2. データモデル

### BudgetData（月間予算データ）
```dart
class BudgetData {
  final double remainingAmount;  // 残り予算
  final double totalBudget;      // 総予算
  final double spentAmount;      // 使用済み金額
  final String period;           // 期間（デフォルト: "今月"）
  
  // 計算プロパティ
  double get spentPercentage => totalBudget > 0 ? spentAmount / totalBudget : 0.0;
  double get remainingPercentage => totalBudget > 0 ? remainingAmount / totalBudget : 0.0;
}
```

### DailyBudget（日別予算データ）
```dart
class DailyBudget {
  final double dailyBudget;      // 1日の予算
  final double todaySpent;       // 今日の支出
  final double remainingToday;   // 今日の残り予算
  final int daysRemaining;       // 月の残り日数
  final DateTime today;          // 今日の日付
  
  // 計算プロパティ
  double get todaySpentPercentage => dailyBudget > 0 ? todaySpent / dailyBudget : 0.0;
  double get remainingTodayPercentage => dailyBudget > 0 ? remainingToday / dailyBudget : 0.0;
}
```

### DailyExpense（日別支出データ）
```dart
class DailyExpense {
  final double amount;    // 支出金額
  final DateTime date;    // 支出日
}
```

## 3. プロバイダーアーキテクチャ

### 主要プロバイダー

#### 3.1 monthlyBudgetProvider
- **型**: `AsyncNotifierProvider<BudgetNotifier, BudgetData>`
- **責任**: 月間予算データの管理
- **機能**:
  - データの永続化（SharedPreferences経由）
  - 予算の更新・リセット
  - 初期データの読み込み

#### 3.2 dailyBudgetProvider
- **型**: `AsyncNotifierProvider<DailyBudgetCtrl, DailyBudget>`
- **責任**: 日別予算の計算と管理
- **依存**: `monthlyBudgetProvider`, `monthlyExpensesProvider`
- **機能**:
  - リアルタイム日別予算計算
  - キャッシュ機能（BudgetCache使用）
  - 自動更新とリフレッシュ

#### 3.3 monthlyExpensesProvider
- **型**: `StateNotifierProvider<MonthlyExpensesNotifier, List<DailyExpense>>`
- **責任**: 支出履歴の管理
- **機能**:
  - 支出データの追加・保存
  - 今日の支出計算
  - 月間総支出の計算

#### 3.4 addExpenseProvider
- **型**: `Provider<Future<void> Function(...)>`
- **責任**: 支出追加のヘルパー
- **依存**: `monthlyExpensesProvider`, `monthlyBudgetProvider`
- **機能**:
  - 支出の追加
  - 関連するプロバイダーの更新

#### 3.5 appInitializationProvider
- **型**: `StateProvider<AppInitializationState>`
- **責任**: アプリ初期化状態の管理
- **機能**:
  - オンボーディング表示制御
  - メイン画面への遷移制御

## 4. ストレージとキャッシュシステム

### 4.1 BudgetStorageService
- **場所**: `lib/services/budget_storage_service.dart`
- **パターン**: Singleton
- **責任**: SharedPreferencesを使用したデータ永続化
- **機能**:
  - 予算データの保存・読み込み
  - 支出履歴の管理

### 4.2 BudgetCache
- **場所**: `lib/services/budget_cache.dart`
- **パターン**: Hydrated Riverpod
- **責任**: 高速なデータアクセス
- **機能**:
  - メモリキャッシュ（即座にアクセス可能）
  - SharedPreferences永続化
  - 非同期データロード中の即座なレスポンス

## 5. データフロー図

```
[アプリ起動]
    ↓
[BudgetCache.initialize()]
    ↓
[monthlyBudgetProvider] → [BudgetStorageService] → [SharedPreferences]
    ↓
[dailyBudgetProvider] ← [monthlyExpensesProvider]
    ↓                      ↓
[BudgetCache]          [今日の支出計算]
    ↓                      ↓
[UI Components] ← ← ← ← ← ← ↓
- CircularProgressWidget
- BudgetCard
- Settings画面
```

## 6. プロバイダー依存関係

### 依存関係チェーン
```
appInitializationProvider (独立)

monthlyBudgetProvider (独立)
    ↓
dailyBudgetProvider (monthlyBudgetProvider, monthlyExpensesProviderに依存)
    ↓
UI Components

monthlyExpensesProvider (独立)
    ↓
addExpenseProvider (monthlyExpensesProvider, monthlyBudgetProviderに依存)
```

### 循環依存の回避
- `dailyBudgetProvider`は読み取り専用で他のプロバイダーを参照
- `addExpenseProvider`は複数のプロバイダーを更新するが、読み取り専用の依存関係のみ
- キャッシュシステムにより、計算結果の即座な利用が可能

## 7. UIコンポーネント

### 7.1 CircularProgressWidget
- **場所**: `lib/components/progress/circular_progress_widget.dart`
- **依存**: `dailyBudgetProvider`
- **機能**: 日別予算の円形プログレス表示

### 7.2 BudgetCard
- **場所**: `lib/components/cards/budget_card.dart`
- **依存**: `monthlyBudgetProvider`
- **機能**: 月間予算の概要表示とアニメーション

### 7.3 ManualInputSheet
- **場所**: `lib/components/sheets/manual_input_sheet.dart`
- **依存**: `addExpenseProvider`
- **機能**: 手動支出入力

## 8. 特徴的な実装パターン

### 8.1 Hydrated Riverpod パターン
```dart
class DailyBudgetCtrl extends AsyncNotifier<DailyBudget> {
  @override
  Future<DailyBudget> build() async {
    // 1. キャッシュを即座にemit
    final cached = BudgetCache.load();
    if (cached != null) {
      state = AsyncData(cached);
    }
    
    // 2. 正規計算
    final result = await _recompute();
    
    // 3. キャッシュ更新
    BudgetCache.save(result);
    
    return result;
  }
}
```

### 8.2 レスポンシブ更新パターン
- 支出追加時に関連するすべてのプロバイダーが自動更新
- UIコンポーネントは自動的に最新データで再描画
- アニメーション付きのスムーズな更新

## 9. パフォーマンス最適化

### 9.1 キャッシュ戦略
- メモリキャッシュによる即座のレスポンス
- バックグラウンドでの正確な計算
- SharedPreferencesによる永続化

### 9.2 計算効率
- 必要時のみ再計算実行
- プロバイダーの依存関係による適切な更新タイミング
- 無駄な計算を避けるための状態管理

## 10. エラーハンドリング

### 10.1 データ読み込みエラー
- デフォルト値による graceful degradation
- エラー状態の適切な表示
- 再試行機能の提供

### 10.2 計算エラー
- 0除算の回避（remainingPercentage, spentPercentage）
- 無限値・NaN値のチェック
- 範囲外値のクランプ処理

## 11. 今後の拡張性

### 11.1 予定されている機能
- クラウド同期機能
- データエクスポート/インポート
- 複数通貨対応
- カテゴリ別予算管理

### 11.2 アーキテクチャの拡張ポイント
- 新しいプロバイダーの追加が容易
- ストレージバックエンドの変更可能
- UIコンポーネントの独立性
- キャッシュ戦略の柔軟性