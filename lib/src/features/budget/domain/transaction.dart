import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_input_method.dart';
import 'receipt_item.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    required double amount,
    required String description,
    required DateTime date,
    required TransactionInputMethod inputMethod,
    String? categoryId,
    @Default([]) List<ReceiptItem> receiptItems,
    String? receiptImagePath,
    double? aiConfidenceScore,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}