// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_analysis_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionSummaryImpl _$$TransactionSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionSummaryImpl(
      amount: (json['amount'] as num).toDouble(),
      category: json['category'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$TransactionSummaryImplToJson(
        _$TransactionSummaryImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'category': instance.category,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };

_$SpendingAnalysisRequestDTOImpl _$$SpendingAnalysisRequestDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$SpendingAnalysisRequestDTOImpl(
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => TransactionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlyBudget: (json['monthlyBudget'] as num).toDouble(),
      analysisType: json['analysisType'] as String,
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      additionalContext: json['additionalContext'] as String?,
    );

Map<String, dynamic> _$$SpendingAnalysisRequestDTOImplToJson(
        _$SpendingAnalysisRequestDTOImpl instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'monthlyBudget': instance.monthlyBudget,
      'analysisType': instance.analysisType,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'additionalContext': instance.additionalContext,
    };
