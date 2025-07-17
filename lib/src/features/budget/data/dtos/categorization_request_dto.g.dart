// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorization_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategorizationRequestDTOImpl _$$CategorizationRequestDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CategorizationRequestDTOImpl(
      itemNames:
          (json['itemNames'] as List<dynamic>).map((e) => e as String).toList(),
      availableCategories: (json['availableCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      additionalContext: json['additionalContext'] as String?,
    );

Map<String, dynamic> _$$CategorizationRequestDTOImplToJson(
        _$CategorizationRequestDTOImpl instance) =>
    <String, dynamic>{
      'itemNames': instance.itemNames,
      'availableCategories': instance.availableCategories,
      'additionalContext': instance.additionalContext,
    };
