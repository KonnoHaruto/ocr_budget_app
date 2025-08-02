import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/receipt_parser.dart';
import '../../domain/transaction_input_method.dart';
import '../controllers/transaction_controller.dart';

class OcrResultScreen extends HookConsumerWidget {
  final String imagePath;
  final String? ocrText;

  const OcrResultScreen({
    super.key,
    required this.imagePath,
    this.ocrText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Parse receipt data only once
    final receiptData = ocrText != null && ocrText!.isNotEmpty 
        ? ReceiptParser.parseReceiptText(ocrText!) 
        : null;

    // Initialize controllers with parsed data
    final amountController = useTextEditingController(
      text: receiptData?.totalAmount?.toInt().toString() ?? '',
    );
    
    final descriptionController = useTextEditingController(
      text: receiptData?.storeName ?? 
            (receiptData?.items.isNotEmpty == true ? receiptData!.items.first : ''),
    );

    final transactionState = ref.watch(transactionControllerProvider);
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: CupertinoColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
            // Top bar with title and close button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'レシート情報を確認',
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
            
            const SizedBox(height: 16),
            
            // Receipt analysis results section
            if (receiptData != null) ...[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CupertinoColors.systemGrey4,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '解析結果',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    if (receiptData.storeName != null) ...[
                      Row(
                        children: [
                          const Text(
                            '店名: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          Text(
                            receiptData.storeName!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    
                    if (receiptData.totalAmount != null) ...[
                      Row(
                        children: [
                          const Text(
                            '検出金額: ',
                            style: TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                          Text(
                            '¥${receiptData.totalAmount!.toInt().toString()}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: CupertinoColors.systemGreen,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                    ],
                    
                    if (receiptData.items.isNotEmpty) ...[
                      const Text(
                        'アイテム:',
                        style: TextStyle(
                          fontSize: 14,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      ...receiptData.items.take(3).map((item) => Padding(
                        padding: const EdgeInsets.only(left: 8, top: 2),
                        child: Text(
                          '• $item',
                          style: const TextStyle(
                            fontSize: 13,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                      )),
                      if (receiptData.items.length > 3)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 2),
                          child: Text(
                            '他${receiptData.items.length - 3}件...',
                            style: const TextStyle(
                              fontSize: 13,
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                        ),
                    ],
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
            ],
            
            // Amount input section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Description input section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            ),
            
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0 ? 20 : 40),
            
            // Save button
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
              child: CupertinoButton(
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(12),
                onPressed: transactionState.isLoading
                    ? null
                    : () => _saveTransaction(context, ref, amountController, descriptionController, receiptData),
                child: transactionState.isLoading
                    ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                    : const Text(
                        '保存',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.white,
                        ),
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

  void _saveTransaction(
    BuildContext context,
    WidgetRef ref,
    TextEditingController amountController,
    TextEditingController descriptionController,
    ReceiptData? receiptData,
  ) async {
    final amountText = amountController.text.trim();
    final description = descriptionController.text.trim();

    // バリデーション
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
      // 手動入力と同じように、金額と説明のみで保存
      await ref.read(transactionControllerProvider.notifier).addTransaction(
        amount: amount,
        description: description,
        inputMethod: TransactionInputMethod.ocr,
        categoryId: null,
        receiptItems: null,
        receiptImagePath: null,
        aiConfidenceScore: null,
      );

      if (context.mounted) {
        // 成功時は画面を閉じる
        Navigator.of(context).pop();
        Navigator.of(context).pop(); // カメラ画面も閉じる
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