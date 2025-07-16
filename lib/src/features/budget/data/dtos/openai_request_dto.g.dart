// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIMessageImpl _$$OpenAIMessageImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIMessageImpl(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$OpenAIMessageImplToJson(_$OpenAIMessageImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

_$OpenAIRequestDTOImpl _$$OpenAIRequestDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenAIRequestDTOImpl(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => OpenAIMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.7,
      maxTokens: (json['maxTokens'] as num?)?.toInt() ?? 1000,
    );

Map<String, dynamic> _$$OpenAIRequestDTOImplToJson(
        _$OpenAIRequestDTOImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages,
      'temperature': instance.temperature,
      'maxTokens': instance.maxTokens,
    };
