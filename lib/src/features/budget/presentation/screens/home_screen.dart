import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/budget_controller.dart';
import '../widgets/circular_budget_display.dart';
import '../widgets/dark_budget_card.dart';
import '../widgets/dark_quick_add_buttons.dart';
import 'budget_setup_screen.dart';

class HomeScreen extends ConsumerWidget {
  final PageController? pageController;
  
  const HomeScreen({super.key, this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budget = ref.watch(budgetControllerProvider.select((s) => s.valueOrNull));
    final calculation = ref.watch(budgetCalculationProvider.select((s) => s.valueOrNull));

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
            CupertinoIcons.settings,
            color: CupertinoColors.black,
            size: 24,
          ),
        ),
      ),
      child: SafeArea(
        child: budget == null
            ? const _NoBudgetSetup()
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    
                    // Circular budget display
                    CircularBudgetDisplay(calculation: calculation),
                    
                    const SizedBox(height: 40),
                    
                    // Monthly overview card
                    calculation != null 
                        ? DarkBudgetCard(calculation: calculation)
                        : Container(
                            width: double.infinity,
                            height: 120,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1C1C1E),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: CupertinoActivityIndicator(
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                    
                    const SizedBox(height: 40),
                    
                    // Quick add buttons
                    const DarkQuickAddButtons(),
                    
                    const SizedBox(height: 40),
                  ],
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

