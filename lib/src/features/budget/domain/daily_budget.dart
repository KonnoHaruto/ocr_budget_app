import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_budget.freezed.dart';
part 'daily_budget.g.dart';

@freezed
class DailyBudget with _$DailyBudget {
  const factory DailyBudget({
    required DateTime date,
    required double amount,
    required DateTime calculatedAt,
  }) = _DailyBudget;

  factory DailyBudget.fromJson(Map<String, dynamic> json) => _$DailyBudgetFromJson(json);
}