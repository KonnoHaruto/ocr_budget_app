// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      id: json['id'] as String,
      monthlyBudget: (json['monthlyBudget'] as num).toDouble(),
      monthEndDay: (json['monthEndDay'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'monthlyBudget': instance.monthlyBudget,
      'monthEndDay': instance.monthEndDay,
      'createdAt': instance.createdAt.toIso8601String(),
    };
