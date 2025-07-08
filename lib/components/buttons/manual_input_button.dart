import 'package:flutter/cupertino.dart';

class ManualInputButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const ManualInputButton({
    super.key,
    this.onTap,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          CupertinoIcons.doc_text,
          color: CupertinoColors.black,
          size: size * 0.4,
        ),
      ),
    );
  }
}