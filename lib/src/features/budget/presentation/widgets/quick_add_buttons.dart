import 'package:flutter/cupertino.dart';
import '../screens/ocr_camera_screen.dart';
import '../screens/manual_transaction_screen.dart';

class QuickAddButtons extends StatelessWidget {
  const QuickAddButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _QuickAddButton(
            icon: CupertinoIcons.camera,
            label: 'Scan Receipt',
            color: CupertinoColors.systemBlue,
            onPressed: () {
              showCupertinoModalPopup<void>(
                context: context,
                builder: (context) => const OcrCameraScreen(),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _QuickAddButton(
            icon: CupertinoIcons.add,
            label: 'Add Manually',
            color: CupertinoColors.systemGreen,
            onPressed: () {
              showCupertinoModalPopup<void>(
                context: context,
                builder: (context) => const ManualTransactionScreen(),
              );
            },
          ),
        ),
      ],
    );
  }

}

class _QuickAddButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _QuickAddButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withValues(alpha: 0.3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}