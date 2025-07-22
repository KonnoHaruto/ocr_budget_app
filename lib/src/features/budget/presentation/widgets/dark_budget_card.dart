import 'package:flutter/cupertino.dart';
import '../../domain/budget_calculation.dart';

class DarkBudgetCard extends StatelessWidget {
  final BudgetCalculation calculation;

  const DarkBudgetCard({
    super.key,
    required this.calculation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '今月',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                  Text(
                    '${calculation.monthEndDate.month}月${calculation.monthEndDate.day}日まで',
                    style: const TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
              if (calculation.todaySpendable < 0)
                const Text(
                  '予算超過',
                  style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemRed,
                  ),
                ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Text(
            '¥${calculation.remainingBudget.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: CupertinoColors.white,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Progress bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey6,
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: (calculation.remainingBudget / calculation.monthlyBudget).clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '予算: ¥${calculation.monthlyBudget.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              Text(
                '使用済み: ¥${calculation.monthlySpent.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}