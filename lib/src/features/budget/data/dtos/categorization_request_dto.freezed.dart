// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categorization_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategorizationRequestDTO _$CategorizationRequestDTOFromJson(
    Map<String, dynamic> json) {
  return _CategorizationRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$CategorizationRequestDTO {
  List<String> get itemNames => throw _privateConstructorUsedError;
  List<String> get availableCategories => throw _privateConstructorUsedError;
  String? get additionalContext => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategorizationRequestDTOCopyWith<CategorizationRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorizationRequestDTOCopyWith<$Res> {
  factory $CategorizationRequestDTOCopyWith(CategorizationRequestDTO value,
          $Res Function(CategorizationRequestDTO) then) =
      _$CategorizationRequestDTOCopyWithImpl<$Res, CategorizationRequestDTO>;
  @useResult
  $Res call(
      {List<String> itemNames,
      List<String> availableCategories,
      String? additionalContext});
}

/// @nodoc
class _$CategorizationRequestDTOCopyWithImpl<$Res,
        $Val extends CategorizationRequestDTO>
    implements $CategorizationRequestDTOCopyWith<$Res> {
  _$CategorizationRequestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemNames = null,
    Object? availableCategories = null,
    Object? additionalContext = freezed,
  }) {
    return _then(_value.copyWith(
      itemNames: null == itemNames
          ? _value.itemNames
          : itemNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableCategories: null == availableCategories
          ? _value.availableCategories
          : availableCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalContext: freezed == additionalContext
          ? _value.additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorizationRequestDTOImplCopyWith<$Res>
    implements $CategorizationRequestDTOCopyWith<$Res> {
  factory _$$CategorizationRequestDTOImplCopyWith(
          _$CategorizationRequestDTOImpl value,
          $Res Function(_$CategorizationRequestDTOImpl) then) =
      __$$CategorizationRequestDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> itemNames,
      List<String> availableCategories,
      String? additionalContext});
}

/// @nodoc
class __$$CategorizationRequestDTOImplCopyWithImpl<$Res>
    extends _$CategorizationRequestDTOCopyWithImpl<$Res,
        _$CategorizationRequestDTOImpl>
    implements _$$CategorizationRequestDTOImplCopyWith<$Res> {
  __$$CategorizationRequestDTOImplCopyWithImpl(
      _$CategorizationRequestDTOImpl _value,
      $Res Function(_$CategorizationRequestDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemNames = null,
    Object? availableCategories = null,
    Object? additionalContext = freezed,
  }) {
    return _then(_$CategorizationRequestDTOImpl(
      itemNames: null == itemNames
          ? _value._itemNames
          : itemNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableCategories: null == availableCategories
          ? _value._availableCategories
          : availableCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      additionalContext: freezed == additionalContext
          ? _value.additionalContext
          : additionalContext // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategorizationRequestDTOImpl implements _CategorizationRequestDTO {
  const _$CategorizationRequestDTOImpl(
      {required final List<String> itemNames,
      required final List<String> availableCategories,
      this.additionalContext})
      : _itemNames = itemNames,
        _availableCategories = availableCategories;

  factory _$CategorizationRequestDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategorizationRequestDTOImplFromJson(json);

  final List<String> _itemNames;
  @override
  List<String> get itemNames {
    if (_itemNames is EqualUnmodifiableListView) return _itemNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemNames);
  }

  final List<String> _availableCategories;
  @override
  List<String> get availableCategories {
    if (_availableCategories is EqualUnmodifiableListView)
      return _availableCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCategories);
  }

  @override
  final String? additionalContext;

  @override
  String toString() {
    return 'CategorizationRequestDTO(itemNames: $itemNames, availableCategories: $availableCategories, additionalContext: $additionalContext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorizationRequestDTOImpl &&
            const DeepCollectionEquality()
                .equals(other._itemNames, _itemNames) &&
            const DeepCollectionEquality()
                .equals(other._availableCategories, _availableCategories) &&
            (identical(other.additionalContext, additionalContext) ||
                other.additionalContext == additionalContext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_itemNames),
      const DeepCollectionEquality().hash(_availableCategories),
      additionalContext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorizationRequestDTOImplCopyWith<_$CategorizationRequestDTOImpl>
      get copyWith => __$$CategorizationRequestDTOImplCopyWithImpl<
          _$CategorizationRequestDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategorizationRequestDTOImplToJson(
      this,
    );
  }
}

abstract class _CategorizationRequestDTO implements CategorizationRequestDTO {
  const factory _CategorizationRequestDTO(
      {required final List<String> itemNames,
      required final List<String> availableCategories,
      final String? additionalContext}) = _$CategorizationRequestDTOImpl;

  factory _CategorizationRequestDTO.fromJson(Map<String, dynamic> json) =
      _$CategorizationRequestDTOImpl.fromJson;

  @override
  List<String> get itemNames;
  @override
  List<String> get availableCategories;
  @override
  String? get additionalContext;
  @override
  @JsonKey(ignore: true)
  _$$CategorizationRequestDTOImplCopyWith<_$CategorizationRequestDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
