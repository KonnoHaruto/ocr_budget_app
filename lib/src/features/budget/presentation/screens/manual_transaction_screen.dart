import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/transaction_controller.dart';
import '../../domain/transaction_input_method.dart';

class ManualTransactionScreen extends HookConsumerWidget {
  const ManualTransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final transactionState = ref.watch(transactionControllerProvider);
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: CupertinoColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          // Main content
          Positioned.fill(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  color: CupertinoColors.black,
                  child: SafeArea(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 60), // Space for top bar
                        
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 32),
                                
                                // Amount input section
                                const Text(
                                  '金額',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                CupertinoTextField(
                                  controller: amountController,
                                  placeholder: '金額を入力（例: 1500）',
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1C1C1E),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: CupertinoColors.systemGrey5,
                                      width: 1,
                                    ),
                                  ),
                                  prefix: const Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Text(
                                      '¥',
                                      style: TextStyle(
                                        color: CupertinoColors.systemGrey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                ),
                                
                                const SizedBox(height: 32),
                                
                                // Description input section
                                const Text(
                                  '詳細',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: CupertinoColors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                CupertinoTextField(
                                  controller: descriptionController,
                                  placeholder: '支出の詳細（例: ランチ、交通費など）',
                                  style: const TextStyle(
                                    color: CupertinoColors.white,
                                    fontSize: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1C1C1E),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: CupertinoColors.systemGrey5,
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  maxLines: 3,
                                  minLines: 1,
                                ),
                                
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                        
                        // Save button
                        Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: SizedBox(
                            width: double.infinity,
                            child: CupertinoButton(
                              color: CupertinoColors.systemBlue,
                              borderRadius: BorderRadius.circular(12),
                              onPressed: transactionState.isLoading 
                                  ? null 
                                  : () => _handleSaveTap(
                                      context, 
                                      ref, 
                                      amountController, 
                                      descriptionController
                                    ),
                              child: transactionState.isLoading 
                                  ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                                  : const Text(
                                      '保存',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
            ),
          ),
          
          // Top bar with title and close button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '支出を追加',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Color(0x40000000),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.xmark,
                        color: CupertinoColors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSaveTap(
    BuildContext context, 
    WidgetRef ref, 
    TextEditingController amountController,
    TextEditingController descriptionController,
  ) async {
    final amountText = amountController.text.trim();
    final description = descriptionController.text.trim();

    if (amountText.isEmpty) {
      _showErrorDialog(context, '金額を入力してください');
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      _showErrorDialog(context, '有効な金額を入力してください');
      return;
    }

    if (description.isEmpty) {
      _showErrorDialog(context, '支出の詳細を入力してください');
      return;
    }

    try {
      await ref.read(transactionControllerProvider.notifier).addTransaction(
        amount: amount,
        description: description,
        inputMethod: TransactionInputMethod.manual,
        categoryId: null,
        receiptItems: null,
        receiptImagePath: null,
        aiConfidenceScore: null,
      );
      
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (context.mounted) {
        _showErrorDialog(context, '取引の保存に失敗しました: $e');
      }
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('エラー'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}