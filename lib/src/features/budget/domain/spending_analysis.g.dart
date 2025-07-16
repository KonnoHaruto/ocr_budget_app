// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingInsightImpl _$$SpendingInsightImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingInsightImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$SpendingInsightImplToJson(
        _$SpendingInsightImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'confidence': instance.confidence,
    };

_$SpendingRecommendationImpl _$$SpendingRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingRecommendationImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      potentialSavings: (json['potentialSavings'] as num).toDouble(),
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$$SpendingRecommendationImplToJson(
        _$SpendingRecommendationImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'potentialSavings': instance.potentialSavings,
      'priority': instance.priority,
    };

_$SpendingAnalysisImpl _$$SpendingAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingAnalysisImpl(
      id: json['id'] as String,
      type: $enumDecode(_$AnalysisTypeEnumMap, json['type']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => SpendingInsight.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendations: (json['recommendations'] as List<dynamic>)
          .map(
              (e) => SpendingRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryBreakdown:
          (json['categoryBreakdown'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SpendingAnalysisImplToJson(
        _$SpendingAnalysisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AnalysisTypeEnumMap[instance.type]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'insights': instance.insights,
      'recommendations': instance.recommendations,
      'categoryBreakdown': instance.categoryBreakdown,
      'totalAmount': instance.totalAmount,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$AnalysisTypeEnumMap = {
  AnalysisType.monthly: 'monthly',
  AnalysisType.weekly: 'weekly',
  AnalysisType.categoryBreakdown: 'categoryBreakdown',
  AnalysisType.spendingTrend: 'spendingTrend',
  AnalysisType.budgetRecommendation: 'budgetRecommendation',
};
