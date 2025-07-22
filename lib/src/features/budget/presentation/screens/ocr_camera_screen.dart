import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OcrCameraScreen extends ConsumerWidget {
  const OcrCameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          color: CupertinoColors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Stack(
          children: [
            // Camera preview placeholder
            Positioned.fill(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                  color: CupertinoColors.black,
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.camera_fill,
                          size: 80,
                          color: CupertinoColors.systemGrey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'カメラプレビュー',
                          style: TextStyle(
                            fontSize: 18,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ここに実際にカメラプレビューが表示されます',
                          style: TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.systemGrey2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ),
            ),
            
            // Top bar with title and close button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'レシートを撮影',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CupertinoColors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Color(0x40000000),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.xmark,
                          color: CupertinoColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom camera controls
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Gallery button
                      _CameraControlButton(
                        icon: CupertinoIcons.photo,
                        onTap: () => _handleGalleryTap(context, ref),
                      ),
                      
                      // Capture button
                      GestureDetector(
                        onTap: () => _handleCaptureTap(context, ref),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: CupertinoColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            CupertinoIcons.camera_fill,
                            color: CupertinoColors.black,
                            size: 32,
                          ),
                        ),
                      ),
                      
                      // Switch camera button
                      _CameraControlButton(
                        icon: CupertinoIcons.camera_rotate,
                        onTap: () => _handleSwitchCameraTap(context, ref),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }

  void _handleGalleryTap(BuildContext context, WidgetRef ref) {
    // TODO: Future implementation with Riverpod state management
    _showComingSoonDialog(context, 'ギャラリー機能');
  }

  void _handleCaptureTap(BuildContext context, WidgetRef ref) {
    // Add haptic feedback
    HapticFeedback.mediumImpact();
    // TODO: Future implementation with Riverpod state management for camera capture
    _showComingSoonDialog(context, '撮影機能');
  }

  void _handleSwitchCameraTap(BuildContext context, WidgetRef ref) {
    // TODO: Future implementation with Riverpod state management for camera switching
    _showComingSoonDialog(context, 'カメラ切り替え機能');
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('開発中'),
        content: Text('$featureは現在開発中です。'),
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

class _CameraControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CameraControlButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0x40000000),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: CupertinoColors.white,
          size: 24,
        ),
      ),
    );
  }
}