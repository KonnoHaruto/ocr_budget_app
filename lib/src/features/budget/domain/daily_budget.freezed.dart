// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyBudget _$DailyBudgetFromJson(Map<String, dynamic> json) {
  return _DailyBudget.fromJson(json);
}

/// @nodoc
mixin _$DailyBudget {
  DateTime get date => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get calculatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyBudgetCopyWith<DailyBudget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyBudgetCopyWith<$Res> {
  factory $DailyBudgetCopyWith(
          DailyBudget value, $Res Function(DailyBudget) then) =
      _$DailyBudgetCopyWithImpl<$Res, DailyBudget>;
  @useResult
  $Res call({DateTime date, double amount, DateTime calculatedAt});
}

/// @nodoc
class _$DailyBudgetCopyWithImpl<$Res, $Val extends DailyBudget>
    implements $DailyBudgetCopyWith<$Res> {
  _$DailyBudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? calculatedAt = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyBudgetImplCopyWith<$Res>
    implements $DailyBudgetCopyWith<$Res> {
  factory _$$DailyBudgetImplCopyWith(
          _$DailyBudgetImpl value, $Res Function(_$DailyBudgetImpl) then) =
      __$$DailyBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double amount, DateTime calculatedAt});
}

/// @nodoc
class __$$DailyBudgetImplCopyWithImpl<$Res>
    extends _$DailyBudgetCopyWithImpl<$Res, _$DailyBudgetImpl>
    implements _$$DailyBudgetImplCopyWith<$Res> {
  __$$DailyBudgetImplCopyWithImpl(
      _$DailyBudgetImpl _value, $Res Function(_$DailyBudgetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? calculatedAt = null,
  }) {
    return _then(_$DailyBudgetImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      calculatedAt: null == calculatedAt
          ? _value.calculatedAt
          : calculatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyBudgetImpl implements _DailyBudget {
  const _$DailyBudgetImpl(
      {required this.date, required this.amount, required this.calculatedAt});

  factory _$DailyBudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyBudgetImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double amount;
  @override
  final DateTime calculatedAt;

  @override
  String toString() {
    return 'DailyBudget(date: $date, amount: $amount, calculatedAt: $calculatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyBudgetImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.calculatedAt, calculatedAt) ||
                other.calculatedAt == calculatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, amount, calculatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyBudgetImplCopyWith<_$DailyBudgetImpl> get copyWith =>
      __$$DailyBudgetImplCopyWithImpl<_$DailyBudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyBudgetImplToJson(
      this,
    );
  }
}

abstract class _DailyBudget implements DailyBudget {
  const factory _DailyBudget(
      {required final DateTime date,
      required final double amount,
      required final DateTime calculatedAt}) = _$DailyBudgetImpl;

  factory _DailyBudget.fromJson(Map<String, dynamic> json) =
      _$DailyBudgetImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get amount;
  @override
  DateTime get calculatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DailyBudgetImplCopyWith<_$DailyBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
