// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorization_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemCategorizationImpl _$$ItemCategorizationImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemCategorizationImpl(
      itemName: json['itemName'] as String,
      suggestedCategory: json['suggestedCategory'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      reasoning: json['reasoning'] as String?,
    );

Map<String, dynamic> _$$ItemCategorizationImplToJson(
        _$ItemCategorizationImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'suggestedCategory': instance.suggestedCategory,
      'confidence': instance.confidence,
      'reasoning': instance.reasoning,
    };

_$CategorizationResponseDTOImpl _$$CategorizationResponseDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorizationResponseDTOImpl(
      categorizations: (json['categorizations'] as List<dynamic>)
          .map((e) => ItemCategorization.fromJson(e as Map<String, dynamic>))
          .toList(),
      overallConfidence: (json['overallConfidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$CategorizationResponseDTOImplToJson(
        _$CategorizationResponseDTOImpl instance) =>
    <String, dynamic>{
      'categorizations': instance.categorizations,
      'overallConfidence': instance.overallConfidence,
    };
