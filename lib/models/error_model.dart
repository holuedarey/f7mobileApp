class ErrorModel {
  String? message;
  bool? isError;

  ErrorModel({this.message, this.isError});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['isError'] = isError;
    return data;
  }
}


class BadRequestErrorResponse {
  String? type;
  String? title;
  int? status;
  String? traceId;
  Errors? errors;

  BadRequestErrorResponse(
      {this.type, this.title, this.status, this.traceId, this.errors});

  BadRequestErrorResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    traceId = json['traceId'];
    errors =
    json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['traceId'] = traceId;
    if (errors != null) {
      data['errors'] = errors!.toJson();
    }
    return data;
  }
}

class Errors {
  List<String>? email;
  Errors({this.email});

  Errors.fromJson(Map<String, dynamic> json) {
    email = json['Email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;
    return data;
  }
}