// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpenAIChoice _$OpenAIChoiceFromJson(Map<String, dynamic> json) {
  return _OpenAIChoice.fromJson(json);
}

/// @nodoc
mixin _$OpenAIChoice {
  OpenAIMessage get message => throw _privateConstructorUsedError;
  String get finishReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAIChoiceCopyWith<OpenAIChoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIChoiceCopyWith<$Res> {
  factory $OpenAIChoiceCopyWith(
          OpenAIChoice value, $Res Function(OpenAIChoice) then) =
      _$OpenAIChoiceCopyWithImpl<$Res, OpenAIChoice>;
  @useResult
  $Res call({OpenAIMessage message, String finishReason});

  $OpenAIMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$OpenAIChoiceCopyWithImpl<$Res, $Val extends OpenAIChoice>
    implements $OpenAIChoiceCopyWith<$Res> {
  _$OpenAIChoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? finishReason = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as OpenAIMessage,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OpenAIMessageCopyWith<$Res> get message {
    return $OpenAIMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAIChoiceImplCopyWith<$Res>
    implements $OpenAIChoiceCopyWith<$Res> {
  factory _$$OpenAIChoiceImplCopyWith(
          _$OpenAIChoiceImpl value, $Res Function(_$OpenAIChoiceImpl) then) =
      __$$OpenAIChoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OpenAIMessage message, String finishReason});

  @override
  $OpenAIMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$OpenAIChoiceImplCopyWithImpl<$Res>
    extends _$OpenAIChoiceCopyWithImpl<$Res, _$OpenAIChoiceImpl>
    implements _$$OpenAIChoiceImplCopyWith<$Res> {
  __$$OpenAIChoiceImplCopyWithImpl(
      _$OpenAIChoiceImpl _value, $Res Function(_$OpenAIChoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? finishReason = null,
  }) {
    return _then(_$OpenAIChoiceImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as OpenAIMessage,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIChoiceImpl implements _OpenAIChoice {
  const _$OpenAIChoiceImpl({required this.message, required this.finishReason});

  factory _$OpenAIChoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIChoiceImplFromJson(json);

  @override
  final OpenAIMessage message;
  @override
  final String finishReason;

  @override
  String toString() {
    return 'OpenAIChoice(message: $message, finishReason: $finishReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIChoiceImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIChoiceImplCopyWith<_$OpenAIChoiceImpl> get copyWith =>
      __$$OpenAIChoiceImplCopyWithImpl<_$OpenAIChoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIChoiceImplToJson(
      this,
    );
  }
}

abstract class _OpenAIChoice implements OpenAIChoice {
  const factory _OpenAIChoice(
      {required final OpenAIMessage message,
      required final String finishReason}) = _$OpenAIChoiceImpl;

  factory _OpenAIChoice.fromJson(Map<String, dynamic> json) =
      _$OpenAIChoiceImpl.fromJson;

  @override
  OpenAIMessage get message;
  @override
  String get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$OpenAIChoiceImplCopyWith<_$OpenAIChoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIMessage _$OpenAIMessageFromJson(Map<String, dynamic> json) {
  return _OpenAIMessage.fromJson(json);
}

/// @nodoc
mixin _$OpenAIMessage {
  String get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAIMessageCopyWith<OpenAIMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIMessageCopyWith<$Res> {
  factory $OpenAIMessageCopyWith(
          OpenAIMessage value, $Res Function(OpenAIMessage) then) =
      _$OpenAIMessageCopyWithImpl<$Res, OpenAIMessage>;
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class _$OpenAIMessageCopyWithImpl<$Res, $Val extends OpenAIMessage>
    implements $OpenAIMessageCopyWith<$Res> {
  _$OpenAIMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenAIMessageImplCopyWith<$Res>
    implements $OpenAIMessageCopyWith<$Res> {
  factory _$$OpenAIMessageImplCopyWith(
          _$OpenAIMessageImpl value, $Res Function(_$OpenAIMessageImpl) then) =
      __$$OpenAIMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String content});
}

/// @nodoc
class __$$OpenAIMessageImplCopyWithImpl<$Res>
    extends _$OpenAIMessageCopyWithImpl<$Res, _$OpenAIMessageImpl>
    implements _$$OpenAIMessageImplCopyWith<$Res> {
  __$$OpenAIMessageImplCopyWithImpl(
      _$OpenAIMessageImpl _value, $Res Function(_$OpenAIMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? content = null,
  }) {
    return _then(_$OpenAIMessageImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIMessageImpl implements _OpenAIMessage {
  const _$OpenAIMessageImpl({required this.role, required this.content});

  factory _$OpenAIMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIMessageImplFromJson(json);

  @override
  final String role;
  @override
  final String content;

  @override
  String toString() {
    return 'OpenAIMessage(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIMessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIMessageImplCopyWith<_$OpenAIMessageImpl> get copyWith =>
      __$$OpenAIMessageImplCopyWithImpl<_$OpenAIMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIMessageImplToJson(
      this,
    );
  }
}

abstract class _OpenAIMessage implements OpenAIMessage {
  const factory _OpenAIMessage(
      {required final String role,
      required final String content}) = _$OpenAIMessageImpl;

  factory _OpenAIMessage.fromJson(Map<String, dynamic> json) =
      _$OpenAIMessageImpl.fromJson;

  @override
  String get role;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$OpenAIMessageImplCopyWith<_$OpenAIMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIUsage _$OpenAIUsageFromJson(Map<String, dynamic> json) {
  return _OpenAIUsage.fromJson(json);
}

/// @nodoc
mixin _$OpenAIUsage {
  int get promptTokens => throw _privateConstructorUsedError;
  int get completionTokens => throw _privateConstructorUsedError;
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAIUsageCopyWith<OpenAIUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIUsageCopyWith<$Res> {
  factory $OpenAIUsageCopyWith(
          OpenAIUsage value, $Res Function(OpenAIUsage) then) =
      _$OpenAIUsageCopyWithImpl<$Res, OpenAIUsage>;
  @useResult
  $Res call({int promptTokens, int completionTokens, int totalTokens});
}

/// @nodoc
class _$OpenAIUsageCopyWithImpl<$Res, $Val extends OpenAIUsage>
    implements $OpenAIUsageCopyWith<$Res> {
  _$OpenAIUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenAIUsageImplCopyWith<$Res>
    implements $OpenAIUsageCopyWith<$Res> {
  factory _$$OpenAIUsageImplCopyWith(
          _$OpenAIUsageImpl value, $Res Function(_$OpenAIUsageImpl) then) =
      __$$OpenAIUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int promptTokens, int completionTokens, int totalTokens});
}

/// @nodoc
class __$$OpenAIUsageImplCopyWithImpl<$Res>
    extends _$OpenAIUsageCopyWithImpl<$Res, _$OpenAIUsageImpl>
    implements _$$OpenAIUsageImplCopyWith<$Res> {
  __$$OpenAIUsageImplCopyWithImpl(
      _$OpenAIUsageImpl _value, $Res Function(_$OpenAIUsageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$OpenAIUsageImpl(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIUsageImpl implements _OpenAIUsage {
  const _$OpenAIUsageImpl(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens});

  factory _$OpenAIUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIUsageImplFromJson(json);

  @override
  final int promptTokens;
  @override
  final int completionTokens;
  @override
  final int totalTokens;

  @override
  String toString() {
    return 'OpenAIUsage(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIUsageImpl &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIUsageImplCopyWith<_$OpenAIUsageImpl> get copyWith =>
      __$$OpenAIUsageImplCopyWithImpl<_$OpenAIUsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIUsageImplToJson(
      this,
    );
  }
}

abstract class _OpenAIUsage implements OpenAIUsage {
  const factory _OpenAIUsage(
      {required final int promptTokens,
      required final int completionTokens,
      required final int totalTokens}) = _$OpenAIUsageImpl;

  factory _OpenAIUsage.fromJson(Map<String, dynamic> json) =
      _$OpenAIUsageImpl.fromJson;

  @override
  int get promptTokens;
  @override
  int get completionTokens;
  @override
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$OpenAIUsageImplCopyWith<_$OpenAIUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpenAIResponseDTO _$OpenAIResponseDTOFromJson(Map<String, dynamic> json) {
  return _OpenAIResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$OpenAIResponseDTO {
  String get id => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  List<OpenAIChoice> get choices => throw _privateConstructorUsedError;
  OpenAIUsage get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAIResponseDTOCopyWith<OpenAIResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIResponseDTOCopyWith<$Res> {
  factory $OpenAIResponseDTOCopyWith(
          OpenAIResponseDTO value, $Res Function(OpenAIResponseDTO) then) =
      _$OpenAIResponseDTOCopyWithImpl<$Res, OpenAIResponseDTO>;
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<OpenAIChoice> choices,
      OpenAIUsage usage});

  $OpenAIUsageCopyWith<$Res> get usage;
}

/// @nodoc
class _$OpenAIResponseDTOCopyWithImpl<$Res, $Val extends OpenAIResponseDTO>
    implements $OpenAIResponseDTOCopyWith<$Res> {
  _$OpenAIResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChoice>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as OpenAIUsage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OpenAIUsageCopyWith<$Res> get usage {
    return $OpenAIUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAIResponseDTOImplCopyWith<$Res>
    implements $OpenAIResponseDTOCopyWith<$Res> {
  factory _$$OpenAIResponseDTOImplCopyWith(_$OpenAIResponseDTOImpl value,
          $Res Function(_$OpenAIResponseDTOImpl) then) =
      __$$OpenAIResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<OpenAIChoice> choices,
      OpenAIUsage usage});

  @override
  $OpenAIUsageCopyWith<$Res> get usage;
}

/// @nodoc
class __$$OpenAIResponseDTOImplCopyWithImpl<$Res>
    extends _$OpenAIResponseDTOCopyWithImpl<$Res, _$OpenAIResponseDTOImpl>
    implements _$$OpenAIResponseDTOImplCopyWith<$Res> {
  __$$OpenAIResponseDTOImplCopyWithImpl(_$OpenAIResponseDTOImpl _value,
      $Res Function(_$OpenAIResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_$OpenAIResponseDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<OpenAIChoice>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as OpenAIUsage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIResponseDTOImpl implements _OpenAIResponseDTO {
  const _$OpenAIResponseDTOImpl(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required final List<OpenAIChoice> choices,
      required this.usage})
      : _choices = choices;

  factory _$OpenAIResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIResponseDTOImplFromJson(json);

  @override
  final String id;
  @override
  final String object;
  @override
  final int created;
  @override
  final String model;
  final List<OpenAIChoice> _choices;
  @override
  List<OpenAIChoice> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final OpenAIUsage usage;

  @override
  String toString() {
    return 'OpenAIResponseDTO(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIResponseDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      const DeepCollectionEquality().hash(_choices), usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIResponseDTOImplCopyWith<_$OpenAIResponseDTOImpl> get copyWith =>
      __$$OpenAIResponseDTOImplCopyWithImpl<_$OpenAIResponseDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _OpenAIResponseDTO implements OpenAIResponseDTO {
  const factory _OpenAIResponseDTO(
      {required final String id,
      required final String object,
      required final int created,
      required final String model,
      required final List<OpenAIChoice> choices,
      required final OpenAIUsage usage}) = _$OpenAIResponseDTOImpl;

  factory _OpenAIResponseDTO.fromJson(Map<String, dynamic> json) =
      _$OpenAIResponseDTOImpl.fromJson;

  @override
  String get id;
  @override
  String get object;
  @override
  int get created;
  @override
  String get model;
  @override
  List<OpenAIChoice> get choices;
  @override
  OpenAIUsage get usage;
  @override
  @JsonKey(ignore: true)
  _$$OpenAIResponseDTOImplCopyWith<_$OpenAIResponseDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
