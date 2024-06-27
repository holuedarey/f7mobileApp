class UserOtpResponse {
  String? date;
  bool? requestSuccessful;
  String? message;
  String? responseCode;

  UserOtpResponse(
      {this.date, this.requestSuccessful, this.message, this.responseCode});

  UserOtpResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    requestSuccessful = json['requestSuccessful'];
    message = json['message'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['requestSuccessful'] = requestSuccessful;
    data['message'] = message;
    data['responseCode'] = responseCode;
    return data;
  }
}

class JsonResponse {
  String? date;
  bool? requestSuccessful;
  String? message;
  String? responseCode;

  JsonResponse(
      {this.date, this.requestSuccessful, this.message, this.responseCode});

  JsonResponse.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    requestSuccessful = json['requestSuccessful'];
    message = json['message'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = date;
    data['requestSuccessful'] = requestSuccessful;
    data['message'] = message;
    data['responseCode'] = responseCode;
    return data;
  }
}


class InvitationResponse {
  String? organizationId;
  String? organizationName;
  String? inviteCode;
  String? email;

  InvitationResponse(
      {this.organizationId,
        this.organizationName,
        this.inviteCode,
        this.email});

  InvitationResponse.fromJson(Map<String, dynamic> json) {
    organizationId = json['organization_id'];
    organizationName = json['organization_name'];
    inviteCode = json['invite_code'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['organization_id'] = organizationId;
    data['organization_name'] = organizationName;
    data['invite_code'] = inviteCode;
    data['email'] = email;
    return data;
  }
}


class RegisterUserResponse {
  String? organizationId;
  String? organizationName;
  String? email;
  String? accessToken;
  String? refreshToken;
  String? tokeType;

  RegisterUserResponse(
      {this.organizationId,
        this.organizationName,
        this.email,
        this.accessToken,
        this.refreshToken,
        this.tokeType});

  RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    organizationId = json['organization_id'];
    organizationName = json['organization_name'];
    email = json['email'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    tokeType = json['toke_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization_id'] = organizationId;
    data['organization_name'] = organizationName;
    data['email'] = email;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['toke_type'] = tokeType;
    return data;
  }
}


class CreateAccountResponse {
  String? firstName;
  String? lastName;
  String? weight;
  String? height;
  String? dateOfBirth;
  int? userId;
  String? uuid;
  String? updatedAt;
  String? createdAt;

  CreateAccountResponse(
      {this.firstName,
        this.lastName,
        this.weight,
        this.height,
        this.dateOfBirth,
        this.userId,
        this.uuid,
        this.updatedAt,
        this.createdAt});

  CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    weight = json['weight'];
    height = json['height'];
    dateOfBirth = json['date_of_birth'];
    userId = json['user_id'];
    uuid = json['uuid'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['weight'] = weight;
    data['height'] = height;
    data['date_of_birth'] = dateOfBirth;
    data['user_id'] = userId;
    data['uuid'] = uuid;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    return data;
  }
}

class CreateAccessPinResponse {
  String? message;
  bool? isError;

  CreateAccessPinResponse({this.message, this.isError});

  CreateAccessPinResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isError'] = this.isError;
    return data;
  }
}

