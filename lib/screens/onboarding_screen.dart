import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';
import '../services/onboarding_service.dart';
import '../providers/budget_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const double _minBudget = 5000.0;
  static const double _maxBudget = 150000.0;
  double _selectedBudget = 100000.0; // 設定画面と同じ初期値

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: IntroductionScreen(
        controlsPosition: const Position(left: 16, right: 16, bottom: 60),
        pages: [
          _buildWelcomePage(),
          _buildFeaturePage(),
          _buildBudgetSetupPage(),
        ],
        onDone: _onOnboardingComplete,
        onSkip: _onOnboardingComplete,
        showSkipButton: false,
        skip: const Text('スキップ'),
        next: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: CupertinoColors.systemBlue,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            '次へ',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        done: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: CupertinoColors.activeGreen,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            '開始',
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: CupertinoColors.systemGrey,
          activeColor: CupertinoColors.systemBlue,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        globalBackgroundColor: CupertinoColors.black,
      ),
    );
  }

  PageViewModel _buildWelcomePage() {
    return PageViewModel(
      title: "家計管理アプリへようこそ",
      body: "OCRを使った革新的な予算管理で、あなたの家計を簡単に記録・管理できます。",
      image: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: CupertinoColors.systemBlue.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(125),
            border: Border.all(
              color: CupertinoColors.systemBlue,
              width: 3,
            ),
          ),
          child: const Icon(
            CupertinoIcons.money_yen_circle_fill,
            size: 120,
            color: CupertinoColors.systemBlue,
          ),
        ),
      ),
      decoration: _buildPageDecoration(),
    );
  }

  PageViewModel _buildFeaturePage() {
    return PageViewModel(
      title: "簡単な機能",
      body: "レシートをカメラで撮影するだけで自動的に金額を認識し、日々の支出を記録できます。",
      image: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: CupertinoColors.activeGreen.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(125),
            border: Border.all(
              color: CupertinoColors.activeGreen,
              width: 3,
            ),
          ),
          child: const Icon(
            CupertinoIcons.camera_fill,
            size: 120,
            color: CupertinoColors.activeGreen,
          ),
        ),
      ),
      decoration: _buildPageDecoration(),
    );
  }

  PageViewModel _buildBudgetSetupPage() {
    return PageViewModel(
      title: "月間予算を設定",
      bodyWidget: Column(
        children: [
          const Text(
            "まずは今月の予算を設定しましょう。後で変更することもできます。",
            style: TextStyle(
              color: CupertinoColors.white,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          // Current amount display - 設定画面と同じスタイル
          GestureDetector(
            onTap: _showBudgetInput,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: CupertinoColors.systemBlue.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '¥${_formatAmount(_selectedBudget)}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    CupertinoIcons.pencil,
                    color: CupertinoColors.systemBlue,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Slider section - 設定画面と同じスタイル
          Column(
            children: [
              // Range labels
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '¥${_formatAmount(_minBudget)}',
                      style: const TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '¥${_formatAmount(_maxBudget)}',
                      style: const TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Slider
              CupertinoSlider(
                value: _selectedBudget,
                min: _minBudget,
                max: _maxBudget,
                divisions: 29, // 5,000 yen increments (145,000 / 5,000 = 29)
                activeColor: CupertinoColors.systemBlue,
                thumbColor: CupertinoColors.white,
                onChanged: (double value) {
                  setState(() {
                    _selectedBudget = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Helper text
          const Text(
            'スライダーを動かして予算を調整',
            style: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      image: const SizedBox.shrink(),
      decoration: _buildPageDecoration(),
    );
  }

  PageDecoration _buildPageDecoration() {
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: CupertinoColors.white,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16.0,
        color: CupertinoColors.white,
        height: 1.5,
      ),
      bodyPadding: EdgeInsets.symmetric(horizontal: 16.0),
      pageColor: CupertinoColors.black,
      imagePadding: EdgeInsets.only(top: 40, bottom: 40),
    );
  }

  void _showBudgetInput() {
    final TextEditingController controller = TextEditingController(
      text: _selectedBudget.toStringAsFixed(0),
    );

    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('金額を入力'),
        content: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: CupertinoTextField(
            controller: controller,
            keyboardType: TextInputType.number,
            placeholder: '金額を入力',
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('¥'),
            ),
            autofocus: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              final newValue = double.tryParse(controller.text);
              if (newValue != null) {
                // Clamp the value within the allowed range - 設定画面と同じ範囲
                final clampedValue = newValue.clamp(_minBudget, _maxBudget);
                setState(() {
                  _selectedBudget = clampedValue;
                });
              }
              Navigator.pop(context);
            },
            isDefaultAction: true,
            child: const Text('確定'),
          ),
        ],
      ),
    );
  }

  String _formatAmount(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  Future<void> _onOnboardingComplete() async {
    try {
      // プロバイダーの初期化を確実にするため、まず読み込みを待つ
      await ref.read(monthlyBudgetProvider.future);
      
      // 予算を設定
      await ref.read(monthlyBudgetProvider.notifier).updateTotalBudget(_selectedBudget);

      // オンボーディング完了をマーク
      await OnboardingService.markOnboardingCompleted();
      await OnboardingService.markInitialBudgetSet();

      // メイン画面に遷移
      if (mounted) {
        context.go('/');
      }
    } catch (e) {
      // エラーハンドリング
      if (mounted) {
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: const Text('エラー'),
            content: const Text('予算の設定に失敗しました。もう一度お試しください。'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }
}