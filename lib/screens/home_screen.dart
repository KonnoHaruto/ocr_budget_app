import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../components/headers/app_header.dart';
import '../components/cards/budget_card.dart';
import '../components/progress/circular_progress_widget.dart';
import '../components/buttons/camera_button.dart';
import '../components/buttons/manual_input_button.dart';
import '../components/camera/camera_sheet.dart';
import '../components/sheets/manual_input_sheet.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: _buildMainContent(context, ref),
    );
  }

  Widget _buildMainContent(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const AppHeader(
            title: 'Budget',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: CircularProgressWidget(),
                    ),
                    const SizedBox(height: 40),
                    BudgetCard(),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CameraButton(
                          onTap: () {
                            _showCameraSheet(context);
                          },
                        ),
                        const SizedBox(width: 32),
                        ManualInputButton(
                          onTap: () {
                            _showManualInputSheet(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 120), // Spacer for bottom tab bar
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCameraSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => const CameraSheet(),
    );
  }

  void _showManualInputSheet(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => const ManualInputSheet(),
      ),
    );
  }
}

