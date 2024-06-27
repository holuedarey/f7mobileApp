import 'package:json_annotation/json_annotation.dart';

part 'result_model.g.dart';

@JsonSerializable()
class ResultModel {
  bool? hasResult;
  dynamic result;
  bool? successful;
  num? resultType;
  String? message;
  List<String>? validationMessages;

  ResultModel(
      {this.hasResult,
      this.result,
      this.successful,
      this.resultType,
      this.message,
      this.validationMessages});

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
