import 'package:freezed_annotation/freezed_annotation.dart';

part 'categorization_request_dto.freezed.dart';
part 'categorization_request_dto.g.dart';

@freezed
class CategorizationRequestDTO with _$CategorizationRequestDTO {
  const factory CategorizationRequestDTO({
    required List<String> itemNames,
    required List<String> availableCategories,
    String? additionalContext,
  }) = _CategorizationRequestDTO;

  factory CategorizationRequestDTO.fromJson(Map<String, dynamic> json) => _$CategorizationRequestDTOFromJson(json);
}