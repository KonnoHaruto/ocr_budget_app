import 'package:flutter/cupertino.dart';
import '../../domain/budget_calculation.dart';

class BudgetCard extends StatelessWidget {
  final BudgetCalculation calculation;

  const BudgetCard({
    super.key,
    required this.calculation,
  });

  @override
  Widget build(BuildContext context) {
    final todaySpendable = calculation.todaySpendable;
    final isOverBudget = todaySpendable < 0;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isOverBudget 
            ? CupertinoColors.systemRed.withValues(alpha: 0.1)
            : CupertinoColors.systemGreen.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOverBudget 
              ? CupertinoColors.systemRed.withValues(alpha: 0.3)
              : CupertinoColors.systemGreen.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today's spendable amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today you can spend',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              Icon(
                isOverBudget 
                    ? CupertinoIcons.exclamationmark_triangle
                    : CupertinoIcons.checkmark_circle,
                color: isOverBudget 
                    ? CupertinoColors.systemRed
                    : CupertinoColors.systemGreen,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '¥${todaySpendable.abs().toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: isOverBudget 
                  ? CupertinoColors.systemRed
                  : CupertinoColors.systemGreen,
            ),
          ),
          
          if (isOverBudget) ...[
            const SizedBox(height: 8),
            const Text(
              'You\'re over budget for today',
              style: TextStyle(
                fontSize: 14,
                color: CupertinoColors.systemRed,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Budget overview
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CupertinoColors.systemBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _BudgetRow(
                  label: 'Monthly Budget',
                  value: '¥${calculation.monthlyBudget.toStringAsFixed(0)}',
                ),
                const SizedBox(height: 12),
                _BudgetRow(
                  label: 'Spent This Month',
                  value: '¥${calculation.monthlySpent.toStringAsFixed(0)}',
                  valueColor: CupertinoColors.systemRed,
                ),
                const SizedBox(height: 12),
                _BudgetRow(
                  label: 'Remaining Days',
                  value: '${calculation.remainingDays} days',
                ),
                const SizedBox(height: 12),
                _BudgetRow(
                  label: 'Month Ends',
                  value: _formatDate(calculation.monthEndDate),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}

class _BudgetRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _BudgetRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: CupertinoColors.systemGrey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: valueColor ?? CupertinoColors.label,
          ),
        ),
      ],
    );
  }
}