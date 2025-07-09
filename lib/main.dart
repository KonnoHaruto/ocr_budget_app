import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/main_tab_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/onboarding_screen.dart';
import 'services/budget_cache.dart';
import 'providers/app_init_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // BudgetCacheを初期化
  await BudgetCache.initialize();
  
  // オンボーディング状態をチェック
  final prefs = await SharedPreferences.getInstance();
  final done = prefs.getBool('onboarding_completed') ?? false;

  runApp(
    ProviderScope(
      overrides: [
        appInitializationProvider.overrideWith(
          (_) => done ? AppInitializationState.showMainApp
                      : AppInitializationState.showOnboarding,
        )
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppInitializer(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainTabScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoApp.router(
      title: 'OCR Budget App',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.white,
        scaffoldBackgroundColor: CupertinoColors.black,
        barBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.white,
        ),
      ),
      routerConfig: _router,
    );
  }
}

class AppInitializer extends ConsumerWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initState = ref.watch(appInitializationProvider);
    
    return switch (initState) {
      AppInitializationState.loading => const CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black,
          child: Center(
            child: CupertinoActivityIndicator(
              color: CupertinoColors.white,
              radius: 20,
            ),
          ),
        ),
      AppInitializationState.showOnboarding => const OnboardingScreen(),
      AppInitializationState.showMainApp => const MainTabScreen(),
    };
  }
}
