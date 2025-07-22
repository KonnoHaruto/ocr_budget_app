import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_calculation.freezed.dart';
part 'budget_calculation.g.dart';

@freezed
class BudgetCalculation with _$BudgetCalculation {
  const factory BudgetCalculation({
    required double todayBudget, // Today's remaining budget (base - today's spending)
    required double baseDailyBudget, // Fixed daily budget calculated at day start
    required int remainingDays,
    required double monthlySpent,
    required double monthlyBudget,
    required double remainingBudget,
    required DateTime monthEndDate,
  }) = _BudgetCalculation;

  factory BudgetCalculation.fromJson(Map<String, dynamic> json) => _$BudgetCalculationFromJson(json);
}