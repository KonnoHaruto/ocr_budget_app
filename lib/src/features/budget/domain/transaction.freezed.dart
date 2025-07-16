// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TransactionInputMethod get inputMethod => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  List<ReceiptItem> get receiptItems => throw _privateConstructorUsedError;
  String? get receiptImagePath => throw _privateConstructorUsedError;
  double? get aiConfidenceScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String id,
      double amount,
      String description,
      DateTime date,
      TransactionInputMethod inputMethod,
      String? categoryId,
      List<ReceiptItem> receiptItems,
      String? receiptImagePath,
      double? aiConfidenceScore});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? description = null,
    Object? date = null,
    Object? inputMethod = null,
    Object? categoryId = freezed,
    Object? receiptItems = null,
    Object? receiptImagePath = freezed,
    Object? aiConfidenceScore = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inputMethod: null == inputMethod
          ? _value.inputMethod
          : inputMethod // ignore: cast_nullable_to_non_nullable
              as TransactionInputMethod,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptItems: null == receiptItems
          ? _value.receiptItems
          : receiptItems // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>,
      receiptImagePath: freezed == receiptImagePath
          ? _value.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      aiConfidenceScore: freezed == aiConfidenceScore
          ? _value.aiConfidenceScore
          : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      String description,
      DateTime date,
      TransactionInputMethod inputMethod,
      String? categoryId,
      List<ReceiptItem> receiptItems,
      String? receiptImagePath,
      double? aiConfidenceScore});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? description = null,
    Object? date = null,
    Object? inputMethod = null,
    Object? categoryId = freezed,
    Object? receiptItems = null,
    Object? receiptImagePath = freezed,
    Object? aiConfidenceScore = freezed,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      inputMethod: null == inputMethod
          ? _value.inputMethod
          : inputMethod // ignore: cast_nullable_to_non_nullable
              as TransactionInputMethod,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptItems: null == receiptItems
          ? _value._receiptItems
          : receiptItems // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>,
      receiptImagePath: freezed == receiptImagePath
          ? _value.receiptImagePath
          : receiptImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      aiConfidenceScore: freezed == aiConfidenceScore
          ? _value.aiConfidenceScore
          : aiConfidenceScore // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.amount,
      required this.description,
      required this.date,
      required this.inputMethod,
      this.categoryId,
      final List<ReceiptItem> receiptItems = const [],
      this.receiptImagePath,
      this.aiConfidenceScore})
      : _receiptItems = receiptItems;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final String description;
  @override
  final DateTime date;
  @override
  final TransactionInputMethod inputMethod;
  @override
  final String? categoryId;
  final List<ReceiptItem> _receiptItems;
  @override
  @JsonKey()
  List<ReceiptItem> get receiptItems {
    if (_receiptItems is EqualUnmodifiableListView) return _receiptItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receiptItems);
  }

  @override
  final String? receiptImagePath;
  @override
  final double? aiConfidenceScore;

  @override
  String toString() {
    return 'Transaction(id: $id, amount: $amount, description: $description, date: $date, inputMethod: $inputMethod, categoryId: $categoryId, receiptItems: $receiptItems, receiptImagePath: $receiptImagePath, aiConfidenceScore: $aiConfidenceScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.inputMethod, inputMethod) ||
                other.inputMethod == inputMethod) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._receiptItems, _receiptItems) &&
            (identical(other.receiptImagePath, receiptImagePath) ||
                other.receiptImagePath == receiptImagePath) &&
            (identical(other.aiConfidenceScore, aiConfidenceScore) ||
                other.aiConfidenceScore == aiConfidenceScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      amount,
      description,
      date,
      inputMethod,
      categoryId,
      const DeepCollectionEquality().hash(_receiptItems),
      receiptImagePath,
      aiConfidenceScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String id,
      required final double amount,
      required final String description,
      required final DateTime date,
      required final TransactionInputMethod inputMethod,
      final String? categoryId,
      final List<ReceiptItem> receiptItems,
      final String? receiptImagePath,
      final double? aiConfidenceScore}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  TransactionInputMethod get inputMethod;
  @override
  String? get categoryId;
  @override
  List<ReceiptItem> get receiptItems;
  @override
  String? get receiptImagePath;
  @override
  double? get aiConfidenceScore;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
