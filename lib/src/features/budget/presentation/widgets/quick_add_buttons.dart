import 'package:flutter/cupertino.dart';

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
              // TODO: Navigate to OCR scanning screen
              _showNotImplemented(context, 'OCR scanning');
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
              // TODO: Navigate to manual input screen
              _showNotImplemented(context, 'Manual input');
            },
          ),
        ),
      ],
    );
  }

  void _showNotImplemented(BuildContext context, String feature) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Coming Soon'),
        content: Text('$feature feature will be implemented soon!'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
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