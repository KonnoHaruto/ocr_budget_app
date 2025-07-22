// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyBudgetImpl _$$DailyBudgetImplFromJson(Map<String, dynamic> json) =>
    _$DailyBudgetImpl(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      calculatedAt: DateTime.parse(json['calculatedAt'] as String),
    );

Map<String, dynamic> _$$DailyBudgetImplToJson(_$DailyBudgetImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'calculatedAt': instance.calculatedAt.toIso8601String(),
    };
