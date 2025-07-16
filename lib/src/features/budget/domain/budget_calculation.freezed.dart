// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_calculation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BudgetCalculation _$BudgetCalculationFromJson(Map<String, dynamic> json) {
  return _BudgetCalculation.fromJson(json);
}

/// @nodoc
mixin _$BudgetCalculation {
  double get todaySpendable => throw _privateConstructorUsedError;
  int get remainingDays => throw _privateConstructorUsedError;
  double get monthlySpent => throw _privateConstructorUsedError;
  double get monthlyBudget => throw _privateConstructorUsedError;
  DateTime get monthEndDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetCalculationCopyWith<BudgetCalculation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCalculationCopyWith<$Res> {
  factory $BudgetCalculationCopyWith(
          BudgetCalculation value, $Res Function(BudgetCalculation) then) =
      _$BudgetCalculationCopyWithImpl<$Res, BudgetCalculation>;
  @useResult
  $Res call(
      {double todaySpendable,
      int remainingDays,
      double monthlySpent,
      double monthlyBudget,
      DateTime monthEndDate});
}

/// @nodoc
class _$BudgetCalculationCopyWithImpl<$Res, $Val extends BudgetCalculation>
    implements $BudgetCalculationCopyWith<$Res> {
  _$BudgetCalculationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySpendable = null,
    Object? remainingDays = null,
    Object? monthlySpent = null,
    Object? monthlyBudget = null,
    Object? monthEndDate = null,
  }) {
    return _then(_value.copyWith(
      todaySpendable: null == todaySpendable
          ? _value.todaySpendable
          : todaySpendable // ignore: cast_nullable_to_non_nullable
              as double,
      remainingDays: null == remainingDays
          ? _value.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      monthEndDate: null == monthEndDate
          ? _value.monthEndDate
          : monthEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetCalculationImplCopyWith<$Res>
    implements $BudgetCalculationCopyWith<$Res> {
  factory _$$BudgetCalculationImplCopyWith(_$BudgetCalculationImpl value,
          $Res Function(_$BudgetCalculationImpl) then) =
      __$$BudgetCalculationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double todaySpendable,
      int remainingDays,
      double monthlySpent,
      double monthlyBudget,
      DateTime monthEndDate});
}

/// @nodoc
class __$$BudgetCalculationImplCopyWithImpl<$Res>
    extends _$BudgetCalculationCopyWithImpl<$Res, _$BudgetCalculationImpl>
    implements _$$BudgetCalculationImplCopyWith<$Res> {
  __$$BudgetCalculationImplCopyWithImpl(_$BudgetCalculationImpl _value,
      $Res Function(_$BudgetCalculationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todaySpendable = null,
    Object? remainingDays = null,
    Object? monthlySpent = null,
    Object? monthlyBudget = null,
    Object? monthEndDate = null,
  }) {
    return _then(_$BudgetCalculationImpl(
      todaySpendable: null == todaySpendable
          ? _value.todaySpendable
          : todaySpendable // ignore: cast_nullable_to_non_nullable
              as double,
      remainingDays: null == remainingDays
          ? _value.remainingDays
          : remainingDays // ignore: cast_nullable_to_non_nullable
              as int,
      monthlySpent: null == monthlySpent
          ? _value.monthlySpent
          : monthlySpent // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      monthEndDate: null == monthEndDate
          ? _value.monthEndDate
          : monthEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetCalculationImpl implements _BudgetCalculation {
  const _$BudgetCalculationImpl(
      {required this.todaySpendable,
      required this.remainingDays,
      required this.monthlySpent,
      required this.monthlyBudget,
      required this.monthEndDate});

  factory _$BudgetCalculationImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetCalculationImplFromJson(json);

  @override
  final double todaySpendable;
  @override
  final int remainingDays;
  @override
  final double monthlySpent;
  @override
  final double monthlyBudget;
  @override
  final DateTime monthEndDate;

  @override
  String toString() {
    return 'BudgetCalculation(todaySpendable: $todaySpendable, remainingDays: $remainingDays, monthlySpent: $monthlySpent, monthlyBudget: $monthlyBudget, monthEndDate: $monthEndDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetCalculationImpl &&
            (identical(other.todaySpendable, todaySpendable) ||
                other.todaySpendable == todaySpendable) &&
            (identical(other.remainingDays, remainingDays) ||
                other.remainingDays == remainingDays) &&
            (identical(other.monthlySpent, monthlySpent) ||
                other.monthlySpent == monthlySpent) &&
            (identical(other.monthlyBudget, monthlyBudget) ||
                other.monthlyBudget == monthlyBudget) &&
            (identical(other.monthEndDate, monthEndDate) ||
                other.monthEndDate == monthEndDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, todaySpendable, remainingDays,
      monthlySpent, monthlyBudget, monthEndDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetCalculationImplCopyWith<_$BudgetCalculationImpl> get copyWith =>
      __$$BudgetCalculationImplCopyWithImpl<_$BudgetCalculationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetCalculationImplToJson(
      this,
    );
  }
}

abstract class _BudgetCalculation implements BudgetCalculation {
  const factory _BudgetCalculation(
      {required final double todaySpendable,
      required final int remainingDays,
      required final double monthlySpent,
      required final double monthlyBudget,
      required final DateTime monthEndDate}) = _$BudgetCalculationImpl;

  factory _BudgetCalculation.fromJson(Map<String, dynamic> json) =
      _$BudgetCalculationImpl.fromJson;

  @override
  double get todaySpendable;
  @override
  int get remainingDays;
  @override
  double get monthlySpent;
  @override
  double get monthlyBudget;
  @override
  DateTime get monthEndDate;
  @override
  @JsonKey(ignore: true)
  _$$BudgetCalculationImplCopyWith<_$BudgetCalculationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
