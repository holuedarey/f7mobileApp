class TokenErrorModel {
  String? error;
  String? errorDescription;

  TokenErrorModel({this.error, this.errorDescription});

  TokenErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorDescription = json['error_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['error'] = this.error;
    data['error_description'] = this.errorDescription;
    return data;
  }
}
