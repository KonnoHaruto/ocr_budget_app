import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'screens/main_tab_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/onboarding_screen.dart';
import 'services/budget_cache.dart';
import 'services/onboarding_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // BudgetCacheを初期化
  await BudgetCache.initialize();
  
  runApp(const ProviderScope(child: MyApp()));
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
    return FutureBuilder<bool>(
      future: OnboardingService.isFirstLaunch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CupertinoPageScaffold(
            backgroundColor: CupertinoColors.black,
            child: Center(
              child: CupertinoActivityIndicator(
                color: CupertinoColors.white,
                radius: 20,
              ),
            ),
          );
        }

        final isFirstLaunch = snapshot.data ?? true;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (isFirstLaunch) {
            context.go('/onboarding');
          } else {
            context.go('/main');
          }
        });

        return const CupertinoPageScaffold(
          backgroundColor: CupertinoColors.black,
          child: Center(
            child: CupertinoActivityIndicator(
              color: CupertinoColors.white,
              radius: 20,
            ),
          ),
        );
      },
    );
  }
}
