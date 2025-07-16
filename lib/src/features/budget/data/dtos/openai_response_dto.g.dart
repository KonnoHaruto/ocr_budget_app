// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OpenAIChoiceImpl _$$OpenAIChoiceImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIChoiceImpl(
      message: OpenAIMessage.fromJson(json['message'] as Map<String, dynamic>),
      finishReason: json['finishReason'] as String,
    );

Map<String, dynamic> _$$OpenAIChoiceImplToJson(_$OpenAIChoiceImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finishReason': instance.finishReason,
    };

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

_$OpenAIUsageImpl _$$OpenAIUsageImplFromJson(Map<String, dynamic> json) =>
    _$OpenAIUsageImpl(
      promptTokens: (json['promptTokens'] as num).toInt(),
      completionTokens: (json['completionTokens'] as num).toInt(),
      totalTokens: (json['totalTokens'] as num).toInt(),
    );

Map<String, dynamic> _$$OpenAIUsageImplToJson(_$OpenAIUsageImpl instance) =>
    <String, dynamic>{
      'promptTokens': instance.promptTokens,
      'completionTokens': instance.completionTokens,
      'totalTokens': instance.totalTokens,
    };

_$OpenAIResponseDTOImpl _$$OpenAIResponseDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenAIResponseDTOImpl(
      id: json['id'] as String,
      object: json['object'] as String,
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map((e) => OpenAIChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage: OpenAIUsage.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OpenAIResponseDTOImplToJson(
        _$OpenAIResponseDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };
