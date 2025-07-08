import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onProfileTap;

  const AppHeader({
    super.key,
    required this.title,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onProfileTap ?? () => context.push('/settings'),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGrey6,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.person_fill,
                color: CupertinoColors.black,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}