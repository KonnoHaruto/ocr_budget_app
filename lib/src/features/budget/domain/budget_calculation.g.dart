// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_calculation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetCalculationImpl _$$BudgetCalculationImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetCalculationImpl(
      todayBudget: (json['todayBudget'] as num).toDouble(),
      baseDailyBudget: (json['baseDailyBudget'] as num).toDouble(),
      remainingDays: (json['remainingDays'] as num).toInt(),
      monthlySpent: (json['monthlySpent'] as num).toDouble(),
      monthlyBudget: (json['monthlyBudget'] as num).toDouble(),
      remainingBudget: (json['remainingBudget'] as num).toDouble(),
      monthEndDate: DateTime.parse(json['monthEndDate'] as String),
    );

Map<String, dynamic> _$$BudgetCalculationImplToJson(
        _$BudgetCalculationImpl instance) =>
    <String, dynamic>{
      'todayBudget': instance.todayBudget,
      'baseDailyBudget': instance.baseDailyBudget,
      'remainingDays': instance.remainingDays,
      'monthlySpent': instance.monthlySpent,
      'monthlyBudget': instance.monthlyBudget,
      'remainingBudget': instance.remainingBudget,
      'monthEndDate': instance.monthEndDate.toIso8601String(),
    };
