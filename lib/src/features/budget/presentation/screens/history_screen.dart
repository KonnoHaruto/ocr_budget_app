import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/transaction_controller.dart';
import '../widgets/recent_transactions.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(transactionControllerProvider);
    await ref.read(transactionControllerProvider.future);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsState = ref.watch(transactionControllerProvider);

    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () => _onRefresh(ref),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              transactionsState.when(
                data: (transactions) => transactions.isEmpty
                    ? SizedBox(
                        height: 400,
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.list_bullet,
                                size: 64,
                                color: CupertinoColors.systemGrey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'No transactions yet',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Add transactions to see them here',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : RecentTransactions(transactions: transactions),
                loading: () => SizedBox(
                  height: 200,
                  child: const Center(
                    child: CupertinoActivityIndicator(color: CupertinoColors.white),
                  ),
                ),
                error: (error, stack) => SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Error: $error',
                      style: const TextStyle(color: CupertinoColors.systemRed),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}