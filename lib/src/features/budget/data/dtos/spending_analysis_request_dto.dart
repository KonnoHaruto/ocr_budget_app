import 'package:freezed_annotation/freezed_annotation.dart';

part 'spending_analysis_request_dto.freezed.dart';
part 'spending_analysis_request_dto.g.dart';

@freezed
class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    required double amount,
    required String category,
    required String description,
    required DateTime date,
  }) = _TransactionSummary;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) => _$TransactionSummaryFromJson(json);
}

@freezed
class SpendingAnalysisRequestDTO with _$SpendingAnalysisRequestDTO {
  const factory SpendingAnalysisRequestDTO({
    required List<TransactionSummary> transactions,
    required double monthlyBudget,
    required String analysisType,
    required DateTime periodStart,
    required DateTime periodEnd,
    String? additionalContext,
  }) = _SpendingAnalysisRequestDTO;

  factory SpendingAnalysisRequestDTO.fromJson(Map<String, dynamic> json) => _$SpendingAnalysisRequestDTOFromJson(json);
}