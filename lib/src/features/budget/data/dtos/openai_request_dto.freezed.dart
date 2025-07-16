// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'openai_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

OpenAIRequestDTO _$OpenAIRequestDTOFromJson(Map<String, dynamic> json) {
  return _OpenAIRequestDTO.fromJson(json);
}

/// @nodoc
mixin _$OpenAIRequestDTO {
  String get model => throw _privateConstructorUsedError;
  List<OpenAIMessage> get messages => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  int get maxTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAIRequestDTOCopyWith<OpenAIRequestDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAIRequestDTOCopyWith<$Res> {
  factory $OpenAIRequestDTOCopyWith(
          OpenAIRequestDTO value, $Res Function(OpenAIRequestDTO) then) =
      _$OpenAIRequestDTOCopyWithImpl<$Res, OpenAIRequestDTO>;
  @useResult
  $Res call(
      {String model,
      List<OpenAIMessage> messages,
      double temperature,
      int maxTokens});
}

/// @nodoc
class _$OpenAIRequestDTOCopyWithImpl<$Res, $Val extends OpenAIRequestDTO>
    implements $OpenAIRequestDTOCopyWith<$Res> {
  _$OpenAIRequestDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<OpenAIMessage>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenAIRequestDTOImplCopyWith<$Res>
    implements $OpenAIRequestDTOCopyWith<$Res> {
  factory _$$OpenAIRequestDTOImplCopyWith(_$OpenAIRequestDTOImpl value,
          $Res Function(_$OpenAIRequestDTOImpl) then) =
      __$$OpenAIRequestDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      List<OpenAIMessage> messages,
      double temperature,
      int maxTokens});
}

/// @nodoc
class __$$OpenAIRequestDTOImplCopyWithImpl<$Res>
    extends _$OpenAIRequestDTOCopyWithImpl<$Res, _$OpenAIRequestDTOImpl>
    implements _$$OpenAIRequestDTOImplCopyWith<$Res> {
  __$$OpenAIRequestDTOImplCopyWithImpl(_$OpenAIRequestDTOImpl _value,
      $Res Function(_$OpenAIRequestDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? temperature = null,
    Object? maxTokens = null,
  }) {
    return _then(_$OpenAIRequestDTOImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<OpenAIMessage>,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      maxTokens: null == maxTokens
          ? _value.maxTokens
          : maxTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OpenAIRequestDTOImpl implements _OpenAIRequestDTO {
  const _$OpenAIRequestDTOImpl(
      {required this.model,
      required final List<OpenAIMessage> messages,
      this.temperature = 0.7,
      this.maxTokens = 1000})
      : _messages = messages;

  factory _$OpenAIRequestDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpenAIRequestDTOImplFromJson(json);

  @override
  final String model;
  final List<OpenAIMessage> _messages;
  @override
  List<OpenAIMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final double temperature;
  @override
  @JsonKey()
  final int maxTokens;

  @override
  String toString() {
    return 'OpenAIRequestDTO(model: $model, messages: $messages, temperature: $temperature, maxTokens: $maxTokens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAIRequestDTOImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.maxTokens, maxTokens) ||
                other.maxTokens == maxTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model,
      const DeepCollectionEquality().hash(_messages), temperature, maxTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAIRequestDTOImplCopyWith<_$OpenAIRequestDTOImpl> get copyWith =>
      __$$OpenAIRequestDTOImplCopyWithImpl<_$OpenAIRequestDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpenAIRequestDTOImplToJson(
      this,
    );
  }
}

abstract class _OpenAIRequestDTO implements OpenAIRequestDTO {
  const factory _OpenAIRequestDTO(
      {required final String model,
      required final List<OpenAIMessage> messages,
      final double temperature,
      final int maxTokens}) = _$OpenAIRequestDTOImpl;

  factory _OpenAIRequestDTO.fromJson(Map<String, dynamic> json) =
      _$OpenAIRequestDTOImpl.fromJson;

  @override
  String get model;
  @override
  List<OpenAIMessage> get messages;
  @override
  double get temperature;
  @override
  int get maxTokens;
  @override
  @JsonKey(ignore: true)
  _$$OpenAIRequestDTOImplCopyWith<_$OpenAIRequestDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
