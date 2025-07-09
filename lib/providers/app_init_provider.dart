import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppInitializationState { loading, showOnboarding, showMainApp }

// 同期的に UI が書き換わるだけなら StateProvider で十分
final appInitializationProvider =
    StateProvider<AppInitializationState>((_) => AppInitializationState.loading);