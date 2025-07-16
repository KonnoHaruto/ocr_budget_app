import 'package:flutter/cupertino.dart';
import '../../domain/transaction.dart';
import '../../domain/transaction_input_method.dart';

class RecentTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const RecentTransactions({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Column(
            children: [
              Icon(
                CupertinoIcons.list_bullet,
                size: 48,
                color: CupertinoColors.systemGrey3,
              ),
              SizedBox(height: 12),
              Text(
                'No transactions yet',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Add your first transaction to get started!',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey2,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: CupertinoColors.systemGrey4,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          for (int i = 0; i < transactions.length; i++) ...[
            _TransactionTile(transaction: transactions[i]),
            if (i < transactions.length - 1)
              Container(
                height: 1,
                color: CupertinoColors.systemGrey5,
              ),
          ],
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const _TransactionTile({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Transaction icon based on input method
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: _getIconColor().withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getIcon(),
              size: 20,
              color: _getIconColor(),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Transaction details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatDate(transaction.date),
                  style: const TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.systemGrey,
                  ),
                ),
              ],
            ),
          ),
          
          // Amount
          Text(
            '¥${transaction.amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.systemRed,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon() {
    switch (transaction.inputMethod) {
      case TransactionInputMethod.ocr:
        return CupertinoIcons.camera;
      case TransactionInputMethod.manual:
        return CupertinoIcons.pencil;
    }
  }

  Color _getIconColor() {
    switch (transaction.inputMethod) {
      case TransactionInputMethod.ocr:
        return CupertinoColors.systemBlue;
      case TransactionInputMethod.manual:
        return CupertinoColors.systemGreen;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }
}