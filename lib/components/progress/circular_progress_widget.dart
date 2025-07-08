import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/budget_provider.dart';
import '../../services/budget_cache.dart';

class CircularProgressWidget extends HookConsumerWidget {
  const CircularProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyBudgetAsync = ref.watch(dailyBudgetProvider);
    
    return dailyBudgetAsync.when(
      data: (dailyBudget) => _buildCircularProgress(dailyBudget),
      loading: () => _buildLoadingProgress(),
      error: (error, stackTrace) => _buildErrorProgress(),
    );
  }

  Widget _buildCircularProgress(DailyBudget dailyBudget) {
    return _CircularProgressContent(dailyBudget: dailyBudget);
  }

  Widget _buildLoadingProgress() {
    return const SizedBox(
      width: 320,
      height: 320,
      child: Center(
        child: CupertinoActivityIndicator(
          color: CupertinoColors.white,
          radius: 16,
        ),
      ),
    );
  }

  Widget _buildErrorProgress() {
    return SizedBox(
      width: 320,
      height: 320,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              color: CupertinoColors.systemRed,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'エラーが発生しました',
              style: TextStyle(
                color: CupertinoColors.systemRed,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class _CircularProgressContent extends HookWidget {
  final DailyBudget dailyBudget;

  const _CircularProgressContent({required this.dailyBudget});

  @override
  Widget build(BuildContext context) {
    // 残り予算の割合を計算（マイナスの場合は0にクランプ）
    final remainingPercentage = (dailyBudget.remainingToday / dailyBudget.dailyBudget).clamp(0.0, 1.0);
    
    // useAnimationControllerでアニメーションコントローラーを作成
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 2500),
    );
    
    // useAnimationでアニメーション値を監視（1.0から減少）
    final animationValue = useAnimation(
      Tween<double>(begin: 1.0, end: remainingPercentage).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
      ),
    );

    // useEffectで予算データの変更を監視してアニメーションを制御
    useEffect(() {
      // 全体から残り予算まで減少するアニメーション（マイナスの場合は0まで）
      animationController.reset(); // 1.0（フル）からリセット
      animationController.animateTo(remainingPercentage);
      return null; // cleanup function (不要な場合はnull)
    }, [dailyBudget.remainingToday, dailyBudget.dailyBudget]);

    return SizedBox(
      width: 320,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CustomPaint(
            size: const Size(320, 320),
            painter: CircularProgressPainter(
              progress: animationValue,
              backgroundColor: CupertinoColors.systemGrey5,
              progressColor: _getProgressColor(remainingPercentage, dailyBudget.remainingToday),
              strokeWidth: 12,
            ),
          ),
          // Center content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '今日の予算',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '¥${_formatAmount(dailyBudget.remainingToday)}',
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                '使用可能',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '¥${_formatAmount(dailyBudget.dailyBudget)}中',
                style: const TextStyle(
                  color: CupertinoColors.systemGrey2,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getProgressColor(double remainingPercentage, double remainingToday) {
    // 予算オーバー時は赤色を表示
    if (remainingToday < 0) {
      return CupertinoColors.systemRed;
    }
    
    // 残り予算の割合による色分け
    if (remainingPercentage > 0.6) {
      return CupertinoColors.activeGreen;
    } else if (remainingPercentage > 0.3) {
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
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2; // Start from top
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.backgroundColor != backgroundColor ||
           oldDelegate.progressColor != progressColor ||
           oldDelegate.strokeWidth != strokeWidth;
  }
}