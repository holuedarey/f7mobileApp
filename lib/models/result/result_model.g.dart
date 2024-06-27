// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return ResultModel(
    hasResult: json['hasResult'] as bool?,
    result: json['result'],
    successful: json['successful'] as bool?,
    resultType: json['resultType'] as num?,
    message: json['message'] as String?,
    validationMessages:
        (json['validationMessages'] as List?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'hasResult': instance.hasResult,
      'result': instance.result,
      'successful': instance.successful,
      'resultType': instance.resultType,
      'message': instance.message,
      'validationMessages': instance.validationMessages,
    };
