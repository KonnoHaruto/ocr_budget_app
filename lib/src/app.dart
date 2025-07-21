import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'features/budget/presentation/screens/main_tab_screen.dart';
import 'features/budget/presentation/controllers/category_controller.dart';

class BudgetApp extends ConsumerStatefulWidget {
  const BudgetApp({super.key});

  @override
  ConsumerState<BudgetApp> createState() => _BudgetAppState();
}

class _BudgetAppState extends ConsumerState<BudgetApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await ref.read(categoryControllerProvider.notifier).initializeDefaultCategories();
        FlutterNativeSplash.remove();
      } catch (e) {
        print('Error initializing default categories: $e');
        FlutterNativeSplash.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'OCR Budget App',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemGreen,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: CupertinoColors.black,
        barBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
        ),
      ),
      home: const MainTabScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}