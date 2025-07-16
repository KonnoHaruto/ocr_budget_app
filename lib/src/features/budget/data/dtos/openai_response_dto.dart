import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_response_dto.freezed.dart';
part 'openai_response_dto.g.dart';

@freezed
class OpenAIChoice with _$OpenAIChoice {
  const factory OpenAIChoice({
    required OpenAIMessage message,
    required String finishReason,
  }) = _OpenAIChoice;

  factory OpenAIChoice.fromJson(Map<String, dynamic> json) => _$OpenAIChoiceFromJson(json);
}

@freezed
class OpenAIMessage with _$OpenAIMessage {
  const factory OpenAIMessage({
    required String role,
    required String content,
  }) = _OpenAIMessage;

  factory OpenAIMessage.fromJson(Map<String, dynamic> json) => _$OpenAIMessageFromJson(json);
}

@freezed
class OpenAIUsage with _$OpenAIUsage {
  const factory OpenAIUsage({
    required int promptTokens,
    required int completionTokens,
    required int totalTokens,
  }) = _OpenAIUsage;

  factory OpenAIUsage.fromJson(Map<String, dynamic> json) => _$OpenAIUsageFromJson(json);
}

@freezed
class OpenAIResponseDTO with _$OpenAIResponseDTO {
  const factory OpenAIResponseDTO({
    required String id,
    required String object,
    required int created,
    required String model,
    required List<OpenAIChoice> choices,
    required OpenAIUsage usage,
  }) = _OpenAIResponseDTO;

  factory OpenAIResponseDTO.fromJson(Map<String, dynamic> json) => _$OpenAIResponseDTOFromJson(json);
}