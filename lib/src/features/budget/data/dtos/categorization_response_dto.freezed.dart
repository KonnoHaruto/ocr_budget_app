// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categorization_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemCategorization _$ItemCategorizationFromJson(Map<String, dynamic> json) {
  return _ItemCategorization.fromJson(json);
}

/// @nodoc
mixin _$ItemCategorization {
  String get itemName => throw _privateConstructorUsedError;
  String get suggestedCategory => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String? get reasoning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCategorizationCopyWith<ItemCategorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCategorizationCopyWith<$Res> {
  factory $ItemCategorizationCopyWith(
          ItemCategorization value, $Res Function(ItemCategorization) then) =
      _$ItemCategorizationCopyWithImpl<$Res, ItemCategorization>;
  @useResult
  $Res call(
      {String itemName,
      String suggestedCategory,
      double confidence,
      String? reasoning});
}

/// @nodoc
class _$ItemCategorizationCopyWithImpl<$Res, $Val extends ItemCategorization>
    implements $ItemCategorizationCopyWith<$Res> {
  _$ItemCategorizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? suggestedCategory = null,
    Object? confidence = null,
    Object? reasoning = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedCategory: null == suggestedCategory
          ? _value.suggestedCategory
          : suggestedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: freezed == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemCategorizationImplCopyWith<$Res>
    implements $ItemCategorizationCopyWith<$Res> {
  factory _$$ItemCategorizationImplCopyWith(_$ItemCategorizationImpl value,
          $Res Function(_$ItemCategorizationImpl) then) =
      __$$ItemCategorizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemName,
      String suggestedCategory,
      double confidence,
      String? reasoning});
}

/// @nodoc
class __$$ItemCategorizationImplCopyWithImpl<$Res>
    extends _$ItemCategorizationCopyWithImpl<$Res, _$ItemCategorizationImpl>
    implements _$$ItemCategorizationImplCopyWith<$Res> {
  __$$ItemCategorizationImplCopyWithImpl(_$ItemCategorizationImpl _value,
      $Res Function(_$ItemCategorizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? suggestedCategory = null,
    Object? confidence = null,
    Object? reasoning = freezed,
  }) {
    return _then(_$ItemCategorizationImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      suggestedCategory: null == suggestedCategory
          ? _value.suggestedCategory
          : suggestedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      reasoning: freezed == reasoning
          ? _value.reasoning
          : reasoning // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemCategorizationImpl implements _ItemCategorization {
  const _$ItemCategorizationImpl(
      {required this.itemName,
      required this.suggestedCategory,
      required this.confidence,
      this.reasoning});

  factory _$ItemCategorizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemCategorizationImplFromJson(json);

  @override
  final String itemName;
  @override
  final String suggestedCategory;
  @override
  final double confidence;
  @override
  final String? reasoning;

  @override
  String toString() {
    return 'ItemCategorization(itemName: $itemName, suggestedCategory: $suggestedCategory, confidence: $confidence, reasoning: $reasoning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemCategorizationImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.suggestedCategory, suggestedCategory) ||
                other.suggestedCategory == suggestedCategory) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, itemName, suggestedCategory, confidence, reasoning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCategorizationImplCopyWith<_$ItemCategorizationImpl> get copyWith =>
      __$$ItemCategorizationImplCopyWithImpl<_$ItemCategorizationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemCategorizationImplToJson(
      this,
    );
  }
}

abstract class _ItemCategorization implements ItemCategorization {
  const factory _ItemCategorization(
      {required final String itemName,
      required final String suggestedCategory,
      required final double confidence,
      final String? reasoning}) = _$ItemCategorizationImpl;

  factory _ItemCategorization.fromJson(Map<String, dynamic> json) =
      _$ItemCategorizationImpl.fromJson;

  @override
  String get itemName;
  @override
  String get suggestedCategory;
  @override
  double get confidence;
  @override
  String? get reasoning;
  @override
  @JsonKey(ignore: true)
  _$$ItemCategorizationImplCopyWith<_$ItemCategorizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategorizationResponseDTO _$CategorizationResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _CategorizationResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$CategorizationResponseDTO {
  List<ItemCategorization> get categorizations =>
      throw _privateConstructorUsedError;
  double get overallConfidence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorizationResponseDTOCopyWith<CategorizationResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorizationResponseDTOCopyWith<$Res> {
  factory $CategorizationResponseDTOCopyWith(CategorizationResponseDTO value,
          $Res Function(CategorizationResponseDTO) then) =
      _$CategorizationResponseDTOCopyWithImpl<$Res, CategorizationResponseDTO>;
  @useResult
  $Res call(
      {List<ItemCategorization> categorizations, double overallConfidence});
}

/// @nodoc
class _$CategorizationResponseDTOCopyWithImpl<$Res,
        $Val extends CategorizationResponseDTO>
    implements $CategorizationResponseDTOCopyWith<$Res> {
  _$CategorizationResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorizations = null,
    Object? overallConfidence = null,
  }) {
    return _then(_value.copyWith(
      categorizations: null == categorizations
          ? _value.categorizations
          : categorizations // ignore: cast_nullable_to_non_nullable
              as List<ItemCategorization>,
      overallConfidence: null == overallConfidence
          ? _value.overallConfidence
          : overallConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorizationResponseDTOImplCopyWith<$Res>
    implements $CategorizationResponseDTOCopyWith<$Res> {
  factory _$$CategorizationResponseDTOImplCopyWith(
          _$CategorizationResponseDTOImpl value,
          $Res Function(_$CategorizationResponseDTOImpl) then) =
      __$$CategorizationResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemCategorization> categorizations, double overallConfidence});
}

/// @nodoc
class __$$CategorizationResponseDTOImplCopyWithImpl<$Res>
    extends _$CategorizationResponseDTOCopyWithImpl<$Res,
        _$CategorizationResponseDTOImpl>
    implements _$$CategorizationResponseDTOImplCopyWith<$Res> {
  __$$CategorizationResponseDTOImplCopyWithImpl(
      _$CategorizationResponseDTOImpl _value,
      $Res Function(_$CategorizationResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categorizations = null,
    Object? overallConfidence = null,
  }) {
    return _then(_$CategorizationResponseDTOImpl(
      categorizations: null == categorizations
          ? _value._categorizations
          : categorizations // ignore: cast_nullable_to_non_nullable
              as List<ItemCategorization>,
      overallConfidence: null == overallConfidence
          ? _value.overallConfidence
          : overallConfidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorizationResponseDTOImpl implements _CategorizationResponseDTO {
  const _$CategorizationResponseDTOImpl(
      {required final List<ItemCategorization> categorizations,
      required this.overallConfidence})
      : _categorizations = categorizations;

  factory _$CategorizationResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorizationResponseDTOImplFromJson(json);

  final List<ItemCategorization> _categorizations;
  @override
  List<ItemCategorization> get categorizations {
    if (_categorizations is EqualUnmodifiableListView) return _categorizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorizations);
  }

  @override
  final double overallConfidence;

  @override
  String toString() {
    return 'CategorizationResponseDTO(categorizations: $categorizations, overallConfidence: $overallConfidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorizationResponseDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._categorizations, _categorizations) &&
            (identical(other.overallConfidence, overallConfidence) ||
                other.overallConfidence == overallConfidence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_categorizations), overallConfidence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorizationResponseDTOImplCopyWith<_$CategorizationResponseDTOImpl>
      get copyWith => __$$CategorizationResponseDTOImplCopyWithImpl<
          _$CategorizationResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorizationResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _CategorizationResponseDTO implements CategorizationResponseDTO {
  const factory _CategorizationResponseDTO(
          {required final List<ItemCategorization> categorizations,
          required final double overallConfidence}) =
      _$CategorizationResponseDTOImpl;

  factory _CategorizationResponseDTO.fromJson(Map<String, dynamic> json) =
      _$CategorizationResponseDTOImpl.fromJson;

  @override
  List<ItemCategorization> get categorizations;
  @override
  double get overallConfidence;
  @override
  @JsonKey(ignore: true)
  _$$CategorizationResponseDTOImplCopyWith<_$CategorizationResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
