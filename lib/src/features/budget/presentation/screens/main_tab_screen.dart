import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_screen_content.dart';
import 'history_screen.dart';
import '../controllers/page_navigation_controller.dart';

class MainTabScreen extends HookConsumerWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();
    final currentPageIndex = ref.watch(currentPageIndexProvider);
    
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: SafeArea(
        child: Column(
          children: [
            // Fixed Header - BeReal style
            Container(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
              child: Column(
                children: [
                  // Top row with title and settings
                  SizedBox(
                    height: 40,
                    child: Stack(
                      children: [
                      // Centered title
                      const Center(
                        child: Text(
                          'BudgetBuddy',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ),
                      // Right-aligned settings button
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.settings,
                            color: CupertinoColors.black,
                            size: 20,
                          ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tab indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _TabIndicator(
                        title: 'Budget',
                        isActive: currentPageIndex == 0,
                        onTap: () {
                          ref.read(currentPageIndexProvider.notifier).state = 0;
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      const SizedBox(width: 60),
                      _TabIndicator(
                        title: 'History',
                        isActive: currentPageIndex == 1,
                        onTap: () {
                          ref.read(currentPageIndexProvider.notifier).state = 1;
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            // Swipeable Content Area
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  ref.read(currentPageIndexProvider.notifier).state = index;
                },
                children: const [
                  HomeScreenContent(),
                  HistoryScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabIndicator extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _TabIndicator({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive 
                  ? CupertinoColors.white 
                  : CupertinoColors.systemGrey,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 50,
            height: 2,
            decoration: BoxDecoration(
              color: isActive 
                  ? CupertinoColors.white 
                  : CupertinoColors.transparent,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}