import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_item.freezed.dart';
part 'receipt_item.g.dart';

@freezed
class ReceiptItem with _$ReceiptItem {
  const factory ReceiptItem({
    required String id,
    required String name,
    required double price,
    required int quantity,
    String? categoryId,
    double? confidenceScore,
    required DateTime createdAt,
  }) = _ReceiptItem;

  factory ReceiptItem.fromJson(Map<String, dynamic> json) => _$ReceiptItemFromJson(json);
}