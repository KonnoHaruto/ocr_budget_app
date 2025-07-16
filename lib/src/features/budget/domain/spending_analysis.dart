import 'package:freezed_annotation/freezed_annotation.dart';
import 'analysis_type.dart';

part 'spending_analysis.freezed.dart';
part 'spending_analysis.g.dart';

@freezed
class SpendingInsight with _$SpendingInsight {
  const factory SpendingInsight({
    required String title,
    required String description,
    required double confidence,
  }) = _SpendingInsight;

  factory SpendingInsight.fromJson(Map<String, dynamic> json) => _$SpendingInsightFromJson(json);
}

@freezed
class SpendingRecommendation with _$SpendingRecommendation {
  const factory SpendingRecommendation({
    required String title,
    required String description,
    required double potentialSavings,
    required int priority,
  }) = _SpendingRecommendation;

  factory SpendingRecommendation.fromJson(Map<String, dynamic> json) => _$SpendingRecommendationFromJson(json);
}

@freezed
class SpendingAnalysis with _$SpendingAnalysis {
  const factory SpendingAnalysis({
    required String id,
    required AnalysisType type,
    required DateTime startDate,
    required DateTime endDate,
    required List<SpendingInsight> insights,
    required List<SpendingRecommendation> recommendations,
    required Map<String, double> categoryBreakdown,
    required double totalAmount,
    required DateTime createdAt,
  }) = _SpendingAnalysis;

  factory SpendingAnalysis.fromJson(Map<String, dynamic> json) => _$SpendingAnalysisFromJson(json);
}