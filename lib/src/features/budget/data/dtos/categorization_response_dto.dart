import 'package:freezed_annotation/freezed_annotation.dart';

part 'categorization_response_dto.freezed.dart';
part 'categorization_response_dto.g.dart';

@freezed
class ItemCategorization with _$ItemCategorization {
  const factory ItemCategorization({
    required String itemName,
    required String suggestedCategory,
    required double confidence,
    String? reasoning,
  }) = _ItemCategorization;

  factory ItemCategorization.fromJson(Map<String, dynamic> json) => _$ItemCategorizationFromJson(json);
}

@freezed
class CategorizationResponseDTO with _$CategorizationResponseDTO {
  const factory CategorizationResponseDTO({
    required List<ItemCategorization> categorizations,
    required double overallConfidence,
  }) = _CategorizationResponseDTO;

  factory CategorizationResponseDTO.fromJson(Map<String, dynamic> json) => _$CategorizationResponseDTOFromJson(json);
}