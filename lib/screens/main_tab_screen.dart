import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tab_provider.dart';
import 'home_screen.dart';
import 'history_screen.dart';

class MainTabScreen extends ConsumerWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider);
    
    final List<Widget> screens = [
      const HomeScreen(),
      const HistoryScreen(),
    ];

    return CupertinoTabScaffold(
      backgroundColor: CupertinoColors.black,
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.black,
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey,
        border: const Border(
          top: BorderSide(
            color: CupertinoColors.systemGrey6,
            width: 0.5,
          ),
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            label: 'History',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(tabIndexProvider.notifier).state = index;
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => screens[index],
        );
      },
    );
  }
}