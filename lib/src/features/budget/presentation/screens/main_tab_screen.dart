import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'history_screen.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: CupertinoColors.black,
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.black,
        activeColor: CupertinoColors.white,
        inactiveColor: CupertinoColors.systemGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.clock),
            label: 'History',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomeScreen();
          case 1:
            return const HistoryScreen();
          default:
            return const HomeScreen();
        }
      },
    );
  }
}