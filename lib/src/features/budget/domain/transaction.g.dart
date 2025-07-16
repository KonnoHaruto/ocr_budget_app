// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      inputMethod:
          $enumDecode(_$TransactionInputMethodEnumMap, json['inputMethod']),
      categoryId: json['categoryId'] as String?,
      receiptItems: (json['receiptItems'] as List<dynamic>?)
              ?.map((e) => ReceiptItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      receiptImagePath: json['receiptImagePath'] as String?,
      aiConfidenceScore: (json['aiConfidenceScore'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'inputMethod': _$TransactionInputMethodEnumMap[instance.inputMethod]!,
      'categoryId': instance.categoryId,
      'receiptItems': instance.receiptItems,
      'receiptImagePath': instance.receiptImagePath,
      'aiConfidenceScore': instance.aiConfidenceScore,
    };

const _$TransactionInputMethodEnumMap = {
  TransactionInputMethod.ocr: 'ocr',
  TransactionInputMethod.manual: 'manual',
};
