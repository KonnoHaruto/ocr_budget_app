import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/budget_provider.dart';

class ManualInputSheet extends ConsumerStatefulWidget {
  const ManualInputSheet({super.key});

  @override
  ConsumerState<ManualInputSheet> createState() => _ManualInputSheetState();
}

class _ManualInputSheetState extends ConsumerState<ManualInputSheet> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'その他';
  DateTime _selectedDate = DateTime.now();

  final List<String> _categories = [
    '食費',
    '交通費',
    '日用品',
    '娯楽',
    '光熱費',
    '医療費',
    'その他',
  ];

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: const Text(
          '手入力で支出を記録',
          style: TextStyle(color: CupertinoColors.white),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'キャンセル',
            style: TextStyle(color: CupertinoColors.systemBlue),
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _saveExpense,
          child: const Text(
            '保存',
            style: TextStyle(color: CupertinoColors.systemBlue),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // 金額入力
              _buildInputSection(
                title: '金額',
                child: CupertinoTextField(
                  controller: _amountController,
                  style: const TextStyle(color: CupertinoColors.white),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6.darkColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  placeholder: '例: 1000',
                  placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
                  keyboardType: TextInputType.number,
                  suffix: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      '円',
                      style: TextStyle(color: CupertinoColors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // カテゴリ選択
              _buildInputSection(
                title: 'カテゴリ',
                child: GestureDetector(
                  onTap: _showCategoryPicker,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6.darkColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedCategory,
                          style: const TextStyle(color: CupertinoColors.white),
                        ),
                        const Icon(
                          CupertinoIcons.chevron_down,
                          color: CupertinoColors.systemGrey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // 日付選択
              _buildInputSection(
                title: '日付',
                child: GestureDetector(
                  onTap: _showDatePicker,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6.darkColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_selectedDate.year}/${_selectedDate.month}/${_selectedDate.day}',
                          style: const TextStyle(color: CupertinoColors.white),
                        ),
                        const Icon(
                          CupertinoIcons.chevron_down,
                          color: CupertinoColors.systemGrey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // 詳細入力
              _buildInputSection(
                title: '詳細（任意）',
                child: CupertinoTextField(
                  controller: _descriptionController,
                  style: const TextStyle(color: CupertinoColors.white),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6.darkColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  placeholder: '例: コンビニで昼食',
                  placeholderStyle: const TextStyle(color: CupertinoColors.systemGrey),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: CupertinoColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }

  void _showCategoryPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 16),
        color: CupertinoColors.black,
        child: Column(
          children: [
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'キャンセル',
                      style: TextStyle(color: CupertinoColors.systemBlue),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      '完了',
                      style: TextStyle(color: CupertinoColors.systemBlue),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                backgroundColor: CupertinoColors.black,
                onSelectedItemChanged: (index) {
                  setState(() {
                    _selectedCategory = _categories[index];
                  });
                },
                itemExtent: 32,
                children: _categories.map((category) {
                  return Center(
                    child: Text(
                      category,
                      style: const TextStyle(color: CupertinoColors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 250,
        padding: const EdgeInsets.only(top: 16),
        color: CupertinoColors.black,
        child: Column(
          children: [
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'キャンセル',
                      style: TextStyle(color: CupertinoColors.systemBlue),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      '完了',
                      style: TextStyle(color: CupertinoColors.systemBlue),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                backgroundColor: CupertinoColors.black,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: _selectedDate,
                maximumDate: DateTime.now(),
                onDateTimeChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveExpense() async {
    if (_amountController.text.isEmpty) {
      _showErrorAlert('金額を入力してください。');
      return;
    }

    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      _showErrorAlert('有効な金額を入力してください。');
      return;
    }

    // 支出データを保存
    final addExpense = ref.read(addExpenseProvider);
    await addExpense(
      amount: amount,
      category: _selectedCategory,
      date: _selectedDate,
      description: _descriptionController.text,
    );

    if (!mounted) return;
    Navigator.of(context).pop();
    
    // 成功メッセージを表示
    if (!mounted) return;
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('保存完了'),
        content: const Text('支出を記録しました。'),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showErrorAlert(String message) {
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