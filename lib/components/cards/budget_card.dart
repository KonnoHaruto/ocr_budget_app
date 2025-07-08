import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/budget_provider.dart';

class BudgetCard extends HookConsumerWidget {
  const BudgetCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetAsync = ref.watch(monthlyBudgetProvider);
    
    return budgetAsync.when(
      data: (budget) => _buildBudgetCard(budget),
      loading: () => _buildLoadingCard(),
      error: (error, stackTrace) => _buildErrorCard(),
    );
  }

  Widget _buildBudgetCard(BudgetData budget) {
    // useAnimationControllerでアニメーションコントローラーを作成
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2000),
    );
    
    // useAnimationでアニメーション値を監視（1.0から減少）
    final animationValue = useAnimation(
      Tween<double>(begin: 1.0, end: budget.remainingPercentage).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
      ),
    );

    // useEffectで予算データの変更を監視してアニメーションを制御
    useEffect(() {
      // 全体から残り予算まで減少するアニメーション
      animationController.reset(); // 1.0（全体）からリセット
      animationController.animateTo(budget.remainingPercentage);
      return null; // cleanup function (不要な場合はnull)
    }, [budget.remainingPercentage]);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.darkColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            budget.period,
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '¥${_formatAmount(budget.remainingAmount)}',
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '残り',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          _buildBudgetProgress(budget, animationValue),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '予算: ¥${_formatAmount(budget.totalBudget)}',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
              Text(
                '使用済み: ¥${_formatAmount(budget.spentAmount)}',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.darkColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '今月',
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '¥0',
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '読み込み中...',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          _buildEmptyProgress(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '予算: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
              Text(
                '使用済み: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6.darkColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '今月',
            style: const TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '¥0',
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'エラーが発生しました',
            style: TextStyle(
              color: CupertinoColors.systemRed,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 14),
          _buildEmptyProgress(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '予算: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
              Text(
                '使用済み: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetProgress(BudgetData budget, double animationProgress) {
    // アニメーション進行値をそのまま使用（1.0から減少）
    final remainingFactor = animationProgress.clamp(0.0, 1.0);
    
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          // 背景（全体の予算）
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey3,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // 残り予算バー（全体から減少していく）
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: remainingFactor,
            child: Container(
              decoration: BoxDecoration(
                color: _getProgressColor(budget.remainingPercentage),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyProgress() {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          // 背景（全体の予算）
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey3,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Color _getProgressColor(double remainingPercentage) {
    if (remainingPercentage > 0.6) {
      return CupertinoColors.activeGreen;
    } else if (remainingPercentage > 0.3) {
      return CupertinoColors.activeOrange;
    } else if (remainingPercentage > 0) {
      return CupertinoColors.systemRed;
    } else {
      return CupertinoColors.systemRed.withValues(alpha: 0.3); // 予算オーバー時は薄い赤
    }
  }

  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

}