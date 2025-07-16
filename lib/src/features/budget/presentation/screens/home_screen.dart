import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/budget_controller.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/budget_card.dart';
import '../widgets/quick_add_buttons.dart';
import '../widgets/recent_transactions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetState = ref.watch(budgetControllerProvider);
    final budgetCalculation = ref.watch(budgetCalculationProvider);
    final transactionsState = ref.watch(currentMonthTransactionsProvider);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Budget Tracker'),
        backgroundColor: CupertinoColors.systemBackground,
      ),
      child: SafeArea(
        child: budgetState.when(
          data: (budget) {
            if (budget == null) {
              return const _NoBudgetSetup();
            }
            
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Budget overview card
                  budgetCalculation.when(
                    data: (calculation) => calculation != null 
                        ? BudgetCard(calculation: calculation)
                        : const SizedBox.shrink(),
                    loading: () => const CupertinoActivityIndicator(),
                    error: (error, stack) => Text('Error: $error'),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Quick add buttons
                  const QuickAddButtons(),
                  
                  const SizedBox(height: 24),
                  
                  // Recent transactions
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  transactionsState.when(
                    data: (transactions) => RecentTransactions(
                      transactions: transactions.take(5).toList(),
                    ),
                    loading: () => const CupertinoActivityIndicator(),
                    error: (error, stack) => Text('Error loading transactions: $error'),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CupertinoActivityIndicator()),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}

class _NoBudgetSetup extends ConsumerWidget {
  const _NoBudgetSetup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.money_dollar_circle,
              size: 80,
              color: CupertinoColors.systemGrey,
            ),
            const SizedBox(height: 24),
            const Text(
              'Welcome to Budget Tracker!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'To get started, set up your monthly budget and choose your month-end date.',
              style: TextStyle(
                fontSize: 16,
                color: CupertinoColors.systemGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CupertinoButton.filled(
              onPressed: () {
                // Navigate to budget setup
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const BudgetSetupScreen(),
                  ),
                );
              },
              child: const Text('Set Up Budget'),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for BudgetSetupScreen - to be implemented
class BudgetSetupScreen extends StatelessWidget {
  const BudgetSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Budget Setup'),
      ),
      child: Center(
        child: Text('Budget Setup Screen - To be implemented'),
      ),
    );
  }
}