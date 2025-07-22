import 'package:flutter/cupertino.dart';
import 'dart:math';
import '../../domain/budget_calculation.dart';

class CircularBudgetDisplay extends StatelessWidget {
  final BudgetCalculation? calculation;

  const CircularBudgetDisplay({
    super.key,
    this.calculation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: CupertinoColors.systemGrey6,
                width: 8,
              ),
            ),
          ),
          
          // Progress circle
          if (calculation != null)
            CustomPaint(
              size: const Size(320, 320),
              painter: CircularProgressPainter(
                progress: _calculateProgress(),
                strokeWidth: 8,
                color: calculation!.todayBudget >= 0 
                    ? CupertinoColors.systemGreen 
                    : CupertinoColors.systemRed,
              ),
            ),
          
          // Center content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '今日の予算',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                calculation != null 
                    ? '¥${calculation!.todayBudget.toStringAsFixed(0)}'
                    : '¥0',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                calculation != null && calculation!.todayBudget >= 0 
                    ? '使用可能' 
                    : '予算超過',
                style: TextStyle(
                  fontSize: 14,
                  color: calculation != null && calculation!.todayBudget >= 0 
                      ? CupertinoColors.systemGrey 
                      : CupertinoColors.systemRed,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              if (calculation != null)
                Text(
                  '¥${calculation!.monthlySpent.toStringAsFixed(0)} / ¥${calculation!.monthlyBudget.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey2,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  double _calculateProgress() {
    if (calculation == null) return 0.0;
    
    final remaining = calculation!.remainingBudget;
    final budget = calculation!.monthlyBudget;
    
    if (budget <= 0) return 0.0;
    
    final progress = remaining / budget;
    return progress.clamp(0.0, 1.0);
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}