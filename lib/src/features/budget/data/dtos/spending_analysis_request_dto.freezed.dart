// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_analysis_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionSummary _$TransactionSummaryFromJson(Map<String, dynamic> json) {
  return _TransactionSummary.fromJson(json);
}

/// @nodoc
mixin _$TransactionSummary {
  double get amount => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionSummaryCopyWith<TransactionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSummaryCopyWith<$Res> {
  factory $TransactionSummaryCopyWith(
          TransactionSummary value, $Res Function(TransactionSummary) then) =
      _$TransactionSummaryCopyWithImpl<$Res, TransactionSummary>;
  @useResult
  $Res call(
      {double amount, String category, String description, DateTime date});
}

/// @nodoc
class _$TransactionSummaryCopyWithImpl<$Res, $Val extends TransactionSummary>
    implements $TransactionSummaryCopyWith<$Res> {
  _$TransactionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionSummaryImplCopyWith<$Res>
    implements $TransactionSummaryCopyWith<$Res> {
  factory _$$TransactionSummaryImplCopyWith(_$TransactionSummaryImpl value,
          $Res Function(_$TransactionSummaryImpl) then) =
      __$$TransactionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount, String category, String description, DateTime date});
}

/// @nodoc
class __$$TransactionSummaryImplCopyWithImpl<$Res>
    extends _$TransactionSummaryCopyWithImpl<$Res, _$TransactionSummaryImpl>
    implements _$$TransactionSummaryImplCopyWith<$Res> {
  __$$TransactionSummaryImplCopyWithImpl(_$TransactionSummaryImpl _value,
      $Res Function(_$TransactionSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? category = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_$TransactionSummaryImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionSummaryImpl implements _TransactionSummary {
  const _$TransactionSummaryImpl(
      {required this.amount,
      required this.category,
      required this.description,
      required this.date});

  factory _$TransactionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionSummaryImplFromJson(json);

  @override
  final double amount;
  @override
  final String category;
  @override
  final String description;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'TransactionSummary(amount: $amount, category: $category, description: $description, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSummaryImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, category, description, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      __$$TransactionSummaryImplCopyWithImpl<_$TransactionSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionSummaryImplToJson(
      this,
    );
  }
}

abstract class _TransactionSummary implements TransactionSummary {
  const factory _TransactionSummary(
      {required final double amount,
      required final String category,
      required final String description,
      required final DateTime date}) = _$TransactionSummaryImpl;

  factory _TransactionSummary.fromJson(Map<String, dynamic> json) =
      _$TransactionSummaryImpl.fromJson;

  @override
  double get amount;
  @override
  String get category;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingAnalysisRequestDTO _$SpendingAnalysisRequestDTOFromJson(
    Map<String, dynamic> json) {
  return _SpendingAnalysisRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$SpendingAnalysisRequestDTO {
  List<TransactionSummary> get transactions =>
      throw _privateConstructorUsedError;
  double get monthlyBudget => throw _privateConstructorUsedError;
  String get analysisType => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  String? get additionalContext => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingAnalysisRequestDTOCopyWith<SpendingAnalysisRequestDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingAnalysisRequestDTOCopyWith<$Res> {
  factory $SpendingAnalysisRequestDTOCopyWith(SpendingAnalysisRequestDTO value,
          $Res Function(SpendingAnalysisRequestDTO) then) =
      _$SpendingAnalysisRequestDTOCopyWithImpl<$Res,
          SpendingAnalysisRequestDTO>;
  @useResult
  $Res call(
      {List<TransactionSummary> transactions,
      double monthlyBudget,
      String analysisType,
      DateTime periodStart,
      DateTime periodEnd,
      String? additionalContext});
}

/// @nodoc
class _$SpendingAnalysisRequestDTOCopyWithImpl<$Res,
        $Val extends SpendingAnalysisRequestDTO>
    implements $SpendingAnalysisRequestDTOCopyWith<$Res> {
  _$SpendingAnalysisRequestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? monthlyBudget = null,
    Object? analysisType = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? additionalContext = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionSummary>,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      additionalContext: freezed == additionalContext
          ? _value.additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingAnalysisRequestDTOImplCopyWith<$Res>
    implements $SpendingAnalysisRequestDTOCopyWith<$Res> {
  factory _$$SpendingAnalysisRequestDTOImplCopyWith(
          _$SpendingAnalysisRequestDTOImpl value,
          $Res Function(_$SpendingAnalysisRequestDTOImpl) then) =
      __$$SpendingAnalysisRequestDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionSummary> transactions,
      double monthlyBudget,
      String analysisType,
      DateTime periodStart,
      DateTime periodEnd,
      String? additionalContext});
}

/// @nodoc
class __$$SpendingAnalysisRequestDTOImplCopyWithImpl<$Res>
    extends _$SpendingAnalysisRequestDTOCopyWithImpl<$Res,
        _$SpendingAnalysisRequestDTOImpl>
    implements _$$SpendingAnalysisRequestDTOImplCopyWith<$Res> {
  __$$SpendingAnalysisRequestDTOImplCopyWithImpl(
      _$SpendingAnalysisRequestDTOImpl _value,
      $Res Function(_$SpendingAnalysisRequestDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? monthlyBudget = null,
    Object? analysisType = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? additionalContext = freezed,
  }) {
    return _then(_$SpendingAnalysisRequestDTOImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionSummary>,
      monthlyBudget: null == monthlyBudget
          ? _value.monthlyBudget
          : monthlyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      additionalContext: freezed == additionalContext
          ? _value.additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingAnalysisRequestDTOImpl implements _SpendingAnalysisRequestDTO {
  const _$SpendingAnalysisRequestDTOImpl(
      {required final List<TransactionSummary> transactions,
      required this.monthlyBudget,
      required this.analysisType,
      required this.periodStart,
      required this.periodEnd,
      this.additionalContext})
      : _transactions = transactions;

  factory _$SpendingAnalysisRequestDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SpendingAnalysisRequestDTOImplFromJson(json);

  final List<TransactionSummary> _transactions;
  @override
  List<TransactionSummary> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final double monthlyBudget;
  @override
  final String analysisType;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final String? additionalContext;

  @override
  String toString() {
    return 'SpendingAnalysisRequestDTO(transactions: $transactions, monthlyBudget: $monthlyBudget, analysisType: $analysisType, periodStart: $periodStart, periodEnd: $periodEnd, additionalContext: $additionalContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingAnalysisRequestDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.monthlyBudget, monthlyBudget) ||
                other.monthlyBudget == monthlyBudget) &&
            (identical(other.analysisType, analysisType) ||
                other.analysisType == analysisType) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.additionalContext, additionalContext) ||
                other.additionalContext == additionalContext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      monthlyBudget,
      analysisType,
      periodStart,
      periodEnd,
      additionalContext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingAnalysisRequestDTOImplCopyWith<_$SpendingAnalysisRequestDTOImpl>
      get copyWith => __$$SpendingAnalysisRequestDTOImplCopyWithImpl<
          _$SpendingAnalysisRequestDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingAnalysisRequestDTOImplToJson(
      this,
    );
  }
}

abstract class _SpendingAnalysisRequestDTO
    implements SpendingAnalysisRequestDTO {
  const factory _SpendingAnalysisRequestDTO(
      {required final List<TransactionSummary> transactions,
      required final double monthlyBudget,
      required final String analysisType,
      required final DateTime periodStart,
      required final DateTime periodEnd,
      final String? additionalContext}) = _$SpendingAnalysisRequestDTOImpl;

  factory _SpendingAnalysisRequestDTO.fromJson(Map<String, dynamic> json) =
      _$SpendingAnalysisRequestDTOImpl.fromJson;

  @override
  List<TransactionSummary> get transactions;
  @override
  double get monthlyBudget;
  @override
  String get analysisType;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  String? get additionalContext;
  @override
  @JsonKey(ignore: true)
  _$$SpendingAnalysisRequestDTOImplCopyWith<_$SpendingAnalysisRequestDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
