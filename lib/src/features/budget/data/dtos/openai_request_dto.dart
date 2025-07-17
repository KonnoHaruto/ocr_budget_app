import 'package:freezed_annotation/freezed_annotation.dart';

part 'openai_request_dto.freezed.dart';
part 'openai_request_dto.g.dart';

@freezed
class OpenAIMessage with _$OpenAIMessage {
  const factory OpenAIMessage({
    required String role,
    required String content,
  }) = _OpenAIMessage;

  factory OpenAIMessage.fromJson(Map<String, dynamic> json) => _$OpenAIMessageFromJson(json);
}

@freezed
class OpenAIRequestDTO with _$OpenAIRequestDTO {
  const factory OpenAIRequestDTO({
    required String model,
    required List<OpenAIMessage> messages,
    @Default(0.7) double temperature,
    @Default(1000) int maxTokens,
  }) = _OpenAIRequestDTO;

  factory OpenAIRequestDTO.fromJson(Map<String, dynamic> json) => _$OpenAIRequestDTOFromJson(json);
}