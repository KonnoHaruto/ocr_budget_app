// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_calculation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetCalculationImpl _$$BudgetCalculationImplFromJson(
        Map<String, dynamic> json) =>
    _$BudgetCalculationImpl(
      todaySpendable: (json['todaySpendable'] as num).toDouble(),
      remainingDays: (json['remainingDays'] as num).toInt(),
      monthlySpent: (json['monthlySpent'] as num).toDouble(),
      monthlyBudget: (json['monthlyBudget'] as num).toDouble(),
      monthEndDate: DateTime.parse(json['monthEndDate'] as String),
    );

Map<String, dynamic> _$$BudgetCalculationImplToJson(
        _$BudgetCalculationImpl instance) =>
    <String, dynamic>{
      'todaySpendable': instance.todaySpendable,
      'remainingDays': instance.remainingDays,
      'monthlySpent': instance.monthlySpent,
      'monthlyBudget': instance.monthlyBudget,
      'monthEndDate': instance.monthEndDate.toIso8601String(),
    };
