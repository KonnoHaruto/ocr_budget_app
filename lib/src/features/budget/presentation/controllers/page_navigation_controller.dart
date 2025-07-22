import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple state provider for current page index
final currentPageIndexProvider = StateProvider<int>((ref) => 0);

// Helper function to animate to a specific page
void animateToPage(WidgetRef ref, PageController controller, int index) {
  if (controller.hasClients) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    // Update the provider state as well
    ref.read(currentPageIndexProvider.notifier).state = index;
  }
}