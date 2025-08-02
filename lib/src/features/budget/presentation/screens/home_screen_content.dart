import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/budget_controller.dart';
import '../controllers/daily_budget_controller.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/circular_budget_display.dart';
import '../widgets/dark_budget_card.dart';
import '../widgets/dark_quick_add_buttons.dart';
import 'budget_setup_screen.dart';

// Content-only version for PageView
class HomeScreenContent extends ConsumerWidget {
  const HomeScreenContent({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    // Only invalidate state-holding providers (AsyncNotifier)
    ref.invalidate(budgetControllerProvider);
    ref.invalidate(dailyBudgetControllerProvider);
    ref.invalidate(transactionControllerProvider);
    
    // budgetCalculationProvider will automatically refresh when dependencies change
    // Wait for the budget calculation to complete
    await ref.read(budgetCalculationProvider.future);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budget = ref.watch(budgetControllerProvider.select((s) => s.valueOrNull));
    final calculation = ref.watch(budgetCalculationProvider.select((s) => s.valueOrNull));

    if (budget == null) {
      return const BudgetSetupScreen();
    }

    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () => _onRefresh(ref),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 8),
              
              // Circular budget display
              CircularBudgetDisplay(calculation: calculation),
              
              const SizedBox(height: 24),
              
              // Monthly budget card
              if (calculation != null) 
                DarkBudgetCard(calculation: calculation),
              
              const SizedBox(height: 20),
              
              // Quick add buttons
              const DarkQuickAddButtons(),
              
              const SizedBox(height: 40),
            ]),
          ),
        ),
      ],
    );
  }
}