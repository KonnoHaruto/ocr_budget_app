import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const _kOnboardingCompleted = 'onboarding_completed';
  static const _kInitialBudgetSet = 'initial_budget_set';
  
  static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_kOnboardingCompleted) ?? false);
  }
  
  static Future<bool> isInitialBudgetSet() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kInitialBudgetSet) ?? false;
  }
  
  static Future<void> markOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardingCompleted, true);
  }
  
  static Future<void> markInitialBudgetSet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kInitialBudgetSet, true);
  }
  
  static Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kOnboardingCompleted);
    await prefs.remove(_kInitialBudgetSet);
  }
}