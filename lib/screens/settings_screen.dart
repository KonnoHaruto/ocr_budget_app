import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/budget_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetAsync = ref.watch(monthlyBudgetProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        border: const Border(
          bottom: BorderSide(
            color: CupertinoColors.systemGrey6,
            width: 0.5,
          ),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Icon(
            CupertinoIcons.back,
            color: CupertinoColors.white,
          ),
        ),
        middle: const Text(
          '設定',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: budgetAsync.when(
              data: (budget) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildBudgetSection(context, ref, budget),
                  const SizedBox(height: 32),
                  _buildAccountSection(context),
                  const SizedBox(height: 32),
                  _buildAppSection(context),
                ],
              ),
              loading: () => const Center(
                child: CupertinoActivityIndicator(
                  color: CupertinoColors.white,
                ),
              ),
              error: (error, stackTrace) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.exclamationmark_triangle,
                      color: CupertinoColors.systemRed,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'データの読み込みに失敗しました',
                      style: TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton(
                      onPressed: () => ref.refresh(monthlyBudgetProvider),
                      child: const Text('再試行'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetSection(BuildContext context, WidgetRef ref, BudgetData budget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '予算設定',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          title: '月間予算',
          value: '¥${_formatAmount(budget.totalBudget)}',
          icon: CupertinoIcons.money_yen_circle,
          onTap: () => _showBudgetEditor(context, ref, budget),
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          title: '今月の使用済み金額',
          value: '¥${_formatAmount(budget.spentAmount)}',
          icon: CupertinoIcons.creditcard,
          onTap: () => _showSpentEditor(context, ref, budget),
        ),
      ],
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'アカウント',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          title: 'プロフィール',
          value: '',
          icon: CupertinoIcons.person_circle,
          onTap: () {
            // TODO: Navigate to profile
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          title: 'データ同期',
          value: '',
          icon: CupertinoIcons.cloud,
          onTap: () {
            // TODO: Navigate to sync settings
          },
        ),
      ],
    );
  }

  Widget _buildAppSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'アプリ',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildSettingCard(
          title: '通知設定',
          value: '',
          icon: CupertinoIcons.bell,
          onTap: () {
            // TODO: Navigate to notification settings
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          title: 'ヘルプ',
          value: '',
          icon: CupertinoIcons.question_circle,
          onTap: () {
            // TODO: Navigate to help
          },
        ),
        const SizedBox(height: 12),
        _buildSettingCard(
          title: 'アプリについて',
          value: 'v1.0.0',
          icon: CupertinoIcons.info_circle,
          onTap: () {
            // TODO: Show about dialog
          },
        ),
      ],
    );
  }

  Widget _buildSettingCard({
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6.darkColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: CupertinoColors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (value.isNotEmpty)
              Text(
                value,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
            const SizedBox(width: 8),
            const Icon(
              CupertinoIcons.chevron_right,
              color: CupertinoColors.systemGrey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showBudgetEditor(BuildContext context, WidgetRef ref, BudgetData budget) {
    const double minBudget = 5000.0;
    const double maxBudget = 150000.0;
    double currentBudget = budget.totalBudget.clamp(minBudget, maxBudget);

    showCupertinoModalPopup(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: 400,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                // Header
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.separator,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'キャンセル',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const Text(
                        '月間予算を設定',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(monthlyBudgetProvider.notifier).updateTotalBudget(currentBudget);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '完了',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Slider content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Current amount display
                        GestureDetector(
                          onTap: () => _showTextInput(context, currentBudget, (value) {
                            setState(() {
                              currentBudget = value;
                            });
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: CupertinoColors.systemBlue.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '¥${_formatAmount(currentBudget)}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  CupertinoIcons.pencil,
                                  color: CupertinoColors.systemBlue,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Slider section
                        Column(
                          children: [
                            // Range labels
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '¥${_formatAmount(minBudget)}',
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '¥${_formatAmount(maxBudget)}',
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Slider
                            CupertinoSlider(
                              value: currentBudget,
                              min: minBudget,
                              max: maxBudget,
                              divisions: 29, // 5,000 yen increments (145,000 / 5,000 = 29)
                              activeColor: CupertinoColors.systemBlue,
                              thumbColor: CupertinoColors.white,
                              onChanged: (double value) {
                                setState(() {
                                  currentBudget = value;
                                });
                              },
                            ),
                          ],
                        ),
                        // Helper text
                        const Text(
                          'スライダーを動かして予算を調整',
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSpentEditor(BuildContext context, WidgetRef ref, BudgetData budget) {
    final double maxSpent = budget.totalBudget > 0 ? budget.totalBudget : 100000.0;
    double currentSpent = budget.spentAmount.clamp(0.0, maxSpent);

    showCupertinoModalPopup(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Container(
          height: 400,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                // Header
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.separator,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text(
                          'キャンセル',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      const Text(
                        '使用済み金額を設定',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(monthlyBudgetProvider.notifier).updateSpentAmount(currentSpent);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '完了',
                          style: TextStyle(
                            color: CupertinoColors.systemBlue,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Slider content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Current amount display
                        GestureDetector(
                          onTap: () => _showSpentTextInput(context, currentSpent, budget.totalBudget, (value) {
                            setState(() {
                              currentSpent = value;
                            });
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: CupertinoColors.systemGrey6,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: CupertinoColors.systemBlue.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '¥${_formatAmount(currentSpent)}',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  CupertinoIcons.pencil,
                                  color: CupertinoColors.systemBlue,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Slider section
                        Column(
                          children: [
                            // Range labels
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '¥0',
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  '¥${_formatAmount(maxSpent)}',
                                  style: const TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Slider
                            CupertinoSlider(
                              value: currentSpent,
                              min: 0.0,
                              max: maxSpent,
                              divisions: (maxSpent / 1000).round(), // 1,000 yen increments
                              activeColor: CupertinoColors.systemRed,
                              thumbColor: CupertinoColors.white,
                              onChanged: (double value) {
                                setState(() {
                                  currentSpent = value;
                                });
                              },
                            ),
                          ],
                        ),
                        // Helper text
                        const Text(
                          'スライダーを動かして使用済み金額を調整',
                          style: TextStyle(
                            color: CupertinoColors.systemGrey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSpentTextInput(BuildContext context, double currentValue, double maxValue, Function(double) onChanged) {
    final TextEditingController controller = TextEditingController(
      text: currentValue.toStringAsFixed(0),
    );

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('使用済み金額を入力'),
        content: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: TextInputType.number,
            placeholder: '使用済み金額を入力',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('¥'),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              final newValue = double.tryParse(controller.text);
              if (newValue != null) {
                // Clamp the value within the allowed range (0 to total budget)
                final clampedValue = newValue.clamp(0.0, maxValue);
                onChanged(clampedValue);
              }
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text('確定'),
          ),
        ],
      ),
    );
  }

  void _showTextInput(BuildContext context, double currentValue, Function(double) onChanged) {
    final TextEditingController controller = TextEditingController(
      text: currentValue.toStringAsFixed(0),
    );

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('金額を入力'),
        content: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: TextInputType.number,
            placeholder: '金額を入力',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('¥'),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              final newValue = double.tryParse(controller.text);
              if (newValue != null) {
                // Clamp the value within the allowed range
                const double minBudget = 5000.0;
                const double maxBudget = 150000.0;
                final clampedValue = newValue.clamp(minBudget, maxBudget);
                onChanged(clampedValue);
              }
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text('確定'),
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}