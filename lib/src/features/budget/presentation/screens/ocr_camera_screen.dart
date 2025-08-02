import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'ocr_result_screen.dart';

class OcrCameraScreen extends ConsumerStatefulWidget {
  const OcrCameraScreen({super.key});

  @override
  ConsumerState<OcrCameraScreen> createState() => _OcrCameraScreenState();
}

class _OcrCameraScreenState extends ConsumerState<OcrCameraScreen> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isProcessingOcr = false;
  final TextRecognizer _textRecognizer = TextRecognizer();

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _textRecognizer.close();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        _cameraController = CameraController(
          cameras.first,
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {
            _isCameraInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Camera initialization error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: CupertinoColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Top bar with title and close button
            Padding(
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
            
            // Camera preview section
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.systemGrey6,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: _isCameraInitialized && _cameraController != null
                      ? GestureDetector(
                          onTapUp: (details) => _onCameraViewTap(details),
                          child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: _cameraController!.value.previewSize!.height,
                                height: _cameraController!.value.previewSize!.width,
                                child: CameraPreview(_cameraController!),
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoActivityIndicator(
                                color: CupertinoColors.systemGrey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'カメラを初期化中...',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Photo mode indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              decoration: BoxDecoration(
                color: CupertinoColors.systemYellow,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'PHOTO',
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Bottom camera controls or loading indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: _isProcessingOcr
                  ? Column(
                      children: [
                        const CupertinoActivityIndicator(
                          color: CupertinoColors.white,
                          radius: 20,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'OCR処理中...',
                          style: TextStyle(
                            fontSize: 16,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Gallery button
                        _CameraControlButton(
                          icon: CupertinoIcons.photo,
                          onTap: () => _handleGalleryTap(context),
                        ),
                        
                        // Capture button
                        GestureDetector(
                          onTap: () => _handleCaptureTap(context),
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
                          onTap: () => _handleSwitchCameraTap(context),
                        ),
                      ],
                    ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _handleGalleryTap(BuildContext context) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      
      if (image != null && mounted) {
        // TODO: Process the selected image for OCR
        _showSuccessDialog(this.context, 'ギャラリーから画像を選択しました: ${image.name}');
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(this.context, 'ギャラリーからの画像選択に失敗しました: $e');
      }
    }
  }

  void _handleCaptureTap(BuildContext context) async {
    // Add haptic feedback
    HapticFeedback.mediumImpact();
    
    if (_cameraController == null || !_isCameraInitialized) {
      if (mounted) {
        _showErrorDialog(this.context, 'カメラが初期化されていません');
      }
      return;
    }
    
    if (_isProcessingOcr) {
      return; // Already processing
    }
    
    try {
      setState(() {
        _isProcessingOcr = true;
      });
      
      final XFile photo = await _cameraController!.takePicture();
      
      if (mounted) {
        // Process OCR
        await _processOcrAndNavigate(photo.path);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(this.context, '写真の撮影に失敗しました: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessingOcr = false;
        });
      }
    }
  }

  Future<void> _processOcrAndNavigate(String imagePath) async {
    try {
      // Process OCR
      final inputImage = InputImage.fromFilePath(imagePath);
      final recognizedText = await _textRecognizer.processImage(inputImage);
      
      if (mounted) {
        // Navigate to result screen
        showCupertinoModalPopup<void>(
          context: context,
          builder: (context) => OcrResultScreen(
            imagePath: imagePath,
            ocrText: recognizedText.text.isNotEmpty ? recognizedText.text : null,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(this.context, 'OCR処理に失敗しました: $e');
      }
    }
  }

  void _onCameraViewTap(TapUpDetails details) async {
    if (_cameraController == null || !_isCameraInitialized) return;

    try {
      // タップ位置を正規化（0.0-1.0の範囲）
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;
      final offset = details.localPosition;
      
      final double x = offset.dx / size.width;
      final double y = offset.dy / size.height;
      
      // フォーカスポイントを設定
      await _cameraController!.setFocusPoint(Offset(x, y));
      
      // 露出も同じポイントに設定（オプション）
      await _cameraController!.setExposurePoint(Offset(x, y));
      
      // ハプティックフィードバック
      HapticFeedback.lightImpact();
      
    } catch (e) {
      debugPrint('Focus failed: $e');
    }
  }

  void _handleSwitchCameraTap(BuildContext context) async {
    if (_cameraController == null) return;
    
    try {
      final cameras = await availableCameras();
      if (cameras.length > 1) {
        final currentCamera = _cameraController!.description;
        final newCamera = cameras.firstWhere(
          (camera) => camera != currentCamera,
          orElse: () => cameras.first,
        );
        
        await _cameraController!.dispose();
        _cameraController = CameraController(newCamera, ResolutionPreset.high);
        await _cameraController!.initialize();
        
        if (mounted) {
          setState(() {});
        }
      } else {
        if (mounted) {
          _showErrorDialog(this.context, '利用可能なカメラが1つしかありません');
        }
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(this.context, 'カメラの切り替えに失敗しました: $e');
      }
    }
  }


  void _showSuccessDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('成功'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('エラー'),
        content: Text(message),
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