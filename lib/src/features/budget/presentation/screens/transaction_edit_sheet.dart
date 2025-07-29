import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/transaction.dart';
import '../controllers/transaction_controller.dart';

class TransactionEditSheet extends HookConsumerWidget {
  final Transaction transaction;

  const TransactionEditSheet({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController(
      text: transaction.amount.toStringAsFixed(0)
    );
    final descriptionController = useTextEditingController(
      text: transaction.description
    );

    Future<void> updateTransaction() async {
      final amount = double.tryParse(amountController.text);
      if (amount == null || amount <= 0) {
        _showErrorDialog(context, '正しい金額を入力してください');
        return;
      }

      try {
        final updatedTransaction = transaction.copyWith(
          amount: amount,
          description: descriptionController.text.trim().isEmpty 
              ? transaction.description 
              : descriptionController.text.trim(),
        );

        await ref.read(transactionControllerProvider.notifier)
            .updateTransaction(updatedTransaction);

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } catch (e) {
        if (context.mounted) {
          _showErrorDialog(context, '取引の更新に失敗しました: $e');
        }
      }
    }

    Future<void> deleteTransaction() async {
      // Show confirmation dialog
      final confirmed = await showCupertinoDialog<bool>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('取引を削除'),
          content: const Text('この取引を削除してもよろしいですか？'),
          actions: [
            CupertinoDialogAction(
              child: const Text(
                'キャンセル',
                style: TextStyle(color: CupertinoColors.white),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('削除'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        try {
          await ref.read(transactionControllerProvider.notifier)
              .deleteTransaction(transaction.id);

          if (context.mounted) {
            Navigator.of(context).pop();
          }
        } catch (e) {
          if (context.mounted) {
            _showErrorDialog(context, '取引の削除に失敗しました: $e');
          }
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.black,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.black,
          border: null,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'キャンセル',
              style: TextStyle(color: CupertinoColors.white),
            ),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: updateTransaction,
            child: const Text(
              '更新',
              style: TextStyle(color: CupertinoColors.systemBlue),
            ),
          ),
          middle: const Text(
            '取引を編集',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                
                // Amount input
                const Text(
                  '金額',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                CupertinoTextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  placeholder: '金額を入力',
                  placeholderStyle: const TextStyle(
                    color: CupertinoColors.systemGrey3,
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    color: CupertinoColors.white,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: CupertinoColors.systemGrey4,
                      width: 0.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      '¥',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Description input (only for manual transactions)
                if (transaction.inputMethod.name == 'manual') ...[
                  const Text(
                    '説明',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CupertinoTextField(
                    controller: descriptionController,
                    placeholder: '説明を入力（オプション）',
                    placeholderStyle: const TextStyle(
                      color: CupertinoColors.systemGrey3,
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.white,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: CupertinoColors.systemGrey4,
                        width: 0.5,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                  ),
                  const SizedBox(height: 24),
                ],
                
                const Spacer(),
                
                // Delete button - subtle and safe
                Center(
                  child: CupertinoButton(
                    onPressed: deleteTransaction,
                    child: const Text(
                      '取引を削除',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CupertinoColors.systemRed,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}