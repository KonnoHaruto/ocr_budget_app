import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/budget_controller.dart';
import '../widgets/circular_budget_display.dart';
import '../widgets/dark_budget_card.dart';
import '../widgets/dark_quick_add_buttons.dart';
import 'budget_setup_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetState = ref.watch(budgetControllerProvider);
    final budgetCalculation = ref.watch(budgetCalculationProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        border: null,
        leading: const Text(
          'Budget',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: CupertinoColors.white,
          ),
        ),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: CupertinoColors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            CupertinoIcons.person_fill,
            color: CupertinoColors.black,
            size: 20,
          ),
        ),
      ),
      child: SafeArea(
        child: budgetState.when(
          data: (budget) {
            if (budget == null) {
              return const _NoBudgetSetup();
            }
            
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  
                  // Circular budget display
                  budgetCalculation.when(
                    data: (calculation) => CircularBudgetDisplay(
                      calculation: calculation,
                    ),
                    loading: () => const CupertinoActivityIndicator(
                      color: CupertinoColors.white,
                    ),
                    error: (error, stack) => const CircularBudgetDisplay(
                      calculation: null,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Monthly overview card
                  budgetCalculation.when(
                    data: (calculation) => calculation != null 
                        ? DarkBudgetCard(calculation: calculation)
                        : const SizedBox.shrink(),
                    loading: () => const CupertinoActivityIndicator(
                      color: CupertinoColors.white,
                    ),
                    error: (error, stack) {
                      print('DEBUG: Error in budgetCalculation: $error');
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'エラーが発生しました: $error',
                            style: const TextStyle(
                              color: CupertinoColors.systemRed,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Quick add buttons
                  const DarkQuickAddButtons(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
          loading: () => const Center(
            child: CupertinoActivityIndicator(color: CupertinoColors.white),
          ),
          error: (error, stack) => Center(
            child: Text(
              'Error: $error',
              style: const TextStyle(color: CupertinoColors.systemRed),
            ),
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
                color: CupertinoColors.white,
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

