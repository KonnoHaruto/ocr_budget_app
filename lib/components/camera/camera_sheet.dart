import 'package:flutter/cupertino.dart';

class CameraSheet extends StatelessWidget {
  const CameraSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: CupertinoColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _buildSheetHeader(context),
          Expanded(
            child: _buildCameraPreview(),
          ),
          _buildCameraControls(context),
        ],
      ),
    );
  }

  Widget _buildSheetHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Drag indicator
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGrey4,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'レシートを撮影',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: CupertinoColors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.camera,
              color: CupertinoColors.systemGrey,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'カメラプレビュー',
              style: TextStyle(
                color: CupertinoColors.systemGrey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '※実装時にカメラプレビューが表示されます',
              style: TextStyle(
                color: CupertinoColors.systemGrey2,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Library button
          GestureDetector(
            onTap: () => _openLibrary(context),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: CupertinoColors.systemGrey4,
                  width: 1,
                ),
              ),
              child: const Icon(
                CupertinoIcons.photo_on_rectangle,
                color: CupertinoColors.white,
                size: 28,
              ),
            ),
          ),
          // Shutter button
          GestureDetector(
            onTap: () => _takePhoto(context),
            child: Container(
              width: 80,
              height: 80,
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
              child: const Icon(
                CupertinoIcons.camera_fill,
                color: CupertinoColors.black,
                size: 32,
              ),
            ),
          ),
          // Switch camera button
          GestureDetector(
            onTap: () => _switchCamera(context),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: CupertinoColors.systemGrey4,
                  width: 1,
                ),
              ),
              child: const Icon(
                CupertinoIcons.camera_rotate,
                color: CupertinoColors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _takePhoto(BuildContext context) {
    // TODO: Implement camera capture
    Navigator.pop(context);
  }

  void _openLibrary(BuildContext context) {
    // TODO: Implement photo library picker
    Navigator.pop(context);
  }

  void _switchCamera(BuildContext context) {
    // TODO: Implement camera switching
  }
}