import 'package:flutter/cupertino.dart';
import '../screens/ocr_camera_screen.dart';
import '../screens/manual_transaction_screen.dart';

class DarkQuickAddButtons extends StatelessWidget {
  const DarkQuickAddButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CircularButton(
          icon: CupertinoIcons.camera,
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => const OcrCameraScreen(),
            );
          },
        ),
        _CircularButton(
          icon: CupertinoIcons.doc_text,
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => const ManualTransactionScreen(),
            );
          },
        ),
      ],
    );
  }

}

class _CircularButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircularButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: CupertinoColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 32,
          color: CupertinoColors.black,
        ),
      ),
    );
  }
}