import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/budget_provider.dart';
import '../../services/budget_cache.dart';

class DailyBudgetCard extends ConsumerWidget {
  const DailyBudgetCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyBudgetAsync = ref.watch(dailyBudgetProvider);
    
    return dailyBudgetAsync.when(
      data: (dailyBudget) => _buildDailyBudgetCard(dailyBudget, ref),
      loading: () => _buildLoadingCard(),
      error: (error, stackTrace) => _buildErrorCard(),
    );
  }

  Widget _buildDailyBudgetCard(DailyBudget dailyBudget, WidgetRef ref) {
    final animationProgress = ref.watch(dailyProgressAnimationProvider);

    // Start animation when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (animationProgress == 1.0) {
        _startAnimation(ref, dailyBudget.remainingTodayPercentage);
      }
    });

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '今日の予算',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '¥${_formatAmount(dailyBudget.remainingToday)}',
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '使用可能',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          _buildBudgetProgress(dailyBudget, animationProgress),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '今日の予算: ¥${_formatAmount(dailyBudget.dailyBudget)}',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                '使用済み: ¥${_formatAmount(dailyBudget.todaySpent)}',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
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
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '今日の予算',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '¥0',
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            '読み込み中...',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          _buildEmptyProgress(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '今日の予算: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                '使用済み: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
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
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '今日の予算',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '¥0',
            style: const TextStyle(
              color: CupertinoColors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'エラーが発生しました',
            style: TextStyle(
              color: CupertinoColors.systemRed,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          _buildEmptyProgress(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '今日の予算: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
                ),
              ),
              Text(
                '使用済み: ¥0',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetProgress(DailyBudget dailyBudget, double animationProgress) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: animationProgress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: _getProgressColor(dailyBudget.todaySpentPercentage),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
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
    );
  }

  Color _getProgressColor(double spentPercentage) {
    if (spentPercentage < 0.5) {
      return CupertinoColors.activeGreen;
    } else if (spentPercentage < 0.8) {
      return CupertinoColors.activeOrange;
    } else {
      return CupertinoColors.systemRed;
    }
  }

  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  void _startAnimation(WidgetRef ref, double targetValue) {
    const duration = Duration(milliseconds: 2000);
    const fps = 60;
    final totalFrames = (duration.inMilliseconds / (1000 / fps)).round();
    
    int currentFrame = 0;
    
    void animateFrame() {
      if (currentFrame >= totalFrames) {
        ref.read(dailyProgressAnimationProvider.notifier).state = targetValue;
        return;
      }
      
      // Smooth easing function (ease-out)
      final progress = currentFrame / totalFrames;
      final easedProgress = 1 - (1 - progress) * (1 - progress);
      final currentValue = 1.0 - (1.0 - targetValue) * easedProgress;
      
      ref.read(dailyProgressAnimationProvider.notifier).state = currentValue;
      
      currentFrame++;
      Future.delayed(const Duration(milliseconds: 16), animateFrame); // ~60fps
    }
    
    animateFrame();
  }
}