import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/headers/app_header.dart';
import '../components/lists/transaction_item.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: SafeArea(
        child: Column(
          children: [
            const AppHeader(
              title: 'History',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildTransactionsList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recent Transactions',
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        TransactionItem(
          title: 'コンビニ',
          amount: 580,
          timeAgo: '2m ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        TransactionItem(
          title: 'スターバックス',
          amount: 750,
          timeAgo: '1h ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        TransactionItem(
          title: 'ランチ',
          amount: 1200,
          timeAgo: '3h ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        TransactionItem(
          title: '電車',
          amount: 160,
          timeAgo: '1d ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        TransactionItem(
          title: 'ガソリン',
          amount: 3500,
          timeAgo: '2d ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
        TransactionItem(
          title: 'スーパー',
          amount: 2800,
          timeAgo: '3d ago',
          onTap: () {
            // TODO: Navigate to transaction details
          },
        ),
      ],
    );
  }
}