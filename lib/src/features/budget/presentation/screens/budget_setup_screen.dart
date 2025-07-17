import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/budget_controller.dart';

class BudgetSetupScreen extends ConsumerStatefulWidget {
  const BudgetSetupScreen({super.key});

  @override
  ConsumerState<BudgetSetupScreen> createState() => _BudgetSetupScreenState();
}

class _BudgetSetupScreenState extends ConsumerState<BudgetSetupScreen> {
  final _monthlyBudgetController = TextEditingController();
  int _selectedMonthEndDay = 31;
  
  @override
  void dispose() {
    _monthlyBudgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final budgetState = ref.watch(budgetControllerProvider);
    
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Budget Setup'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              
              // Monthly Budget Input
              const Text(
                'Monthly Budget',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _monthlyBudgetController,
                placeholder: 'Enter your monthly budget (¥)',
                keyboardType: TextInputType.number,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text('¥'),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey4),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Month End Day Picker
              const Text(
                'Month End Day',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose the day of the month when your budget period ends',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              const SizedBox(height: 12),
              
              Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: _selectedMonthEndDay - 1,
                  ),
                  itemExtent: 32,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedMonthEndDay = index + 1;
                    });
                  },
                  children: List.generate(31, (index) {
                    final day = index + 1;
                    return Center(
                      child: Text(
                        '$day${_getDaySuffix(day)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }),
                ),
              ),
              
              const Spacer(),
              
              // Save Button
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  onPressed: budgetState.isLoading ? null : _saveBudget,
                  child: budgetState.isLoading 
                      ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                      : const Text('Save Budget'),
                ),
              ),
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1: return 'st';
      case 2: return 'nd';
      case 3: return 'rd';
      default: return 'th';
    }
  }

  void _saveBudget() async {
    final budgetText = _monthlyBudgetController.text.trim();
    if (budgetText.isEmpty) {
      _showErrorDialog('Please enter your monthly budget');
      return;
    }

    final budget = double.tryParse(budgetText);
    if (budget == null || budget <= 0) {
      _showErrorDialog('Please enter a valid budget amount');
      return;
    }

    try {
      await ref.read(budgetControllerProvider.notifier).createBudget(
        monthlyBudget: budget,
        monthEndDay: _selectedMonthEndDay,
      );
      
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      _showErrorDialog('Failed to save budget: $e');
    }
  }

  void _showErrorDialog(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Error'),
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