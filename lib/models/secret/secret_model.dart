import 'package:json_annotation/json_annotation.dart';

class SecretModel {
  String? date;
  bool? requestSuccessful;
  ResponseData? responseData;
  String? message;

  SecretModel(
      {this.date, this.requestSuccessful, this.responseData, this.message});

  SecretModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    requestSuccessful = json['requestSuccessful'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['requestSuccessful'] = requestSuccessful;
    if (responseData != null) {
      data['responseData'] = responseData!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class ResponseData {
  UserDetail? userDetail;
  String? token;
  String? refreshToken;

  ResponseData({this.userDetail, this.token, this.refreshToken});

  ResponseData.fromJson(Map<String, dynamic> json) {
    userDetail = json['userDetail'] != null
        ? UserDetail.fromJson(json['userDetail'])
        : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (userDetail != null) {
      data['userDetail'] = userDetail!.toJson();
    }
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class UserDetail {
  String? id;
  String? username;
  String? phone;
  List<String>? role;

  UserDetail({this.id, this.username, this.phone, this.role});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    phone = json['phone'];
    role = json['role'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['phone'] = phone;
    data['role'] = role;
    return data;
  }
}
class EmployeeData {
  String? sId;
  String? name;
  String? phoneNumber;
  num? activationPin;
  num? pinConfirmation;
  num? pin;
  String? fullName;
  String? firstName;
  String? lastName;
  String? employeeId;
  String? email;
  String? bankName;
  String? bankCode;
  String? jobTitle;
  String? bankAccountNumber;
  bool? isOnboardedOnApp;
  bool? autoPaySetup;

  EmployeeData(
      {this.sId,
      this.name,
      this.phoneNumber,
      this.activationPin,
      this.pinConfirmation,
      this.pin,
      this.firstName,
      this.lastName,
      this.employeeId,
      this.email,
      this.bankName,
      this.bankCode,
      this.jobTitle,
      this.bankAccountNumber,
      this.isOnboardedOnApp,
      this.autoPaySetup});

  EmployeeData.fromJson(Map<String, dynamic> json) {
    sId = json[' _id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    activationPin = json['activationPin'];
    pinConfirmation = json['pin_confirmation'];
    pin = json['pin'];
    fullName = json['fullName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    employeeId = json['employeeId'];
    email = json['email'];
    bankName = json['bankName'];
    bankCode = json['bankCode'];
    jobTitle = json['jobTitle'];
    bankAccountNumber = json['bankAccountNumber'];
    isOnboardedOnApp = json['isOnboardedOnApp'];
    autoPaySetup = json['autoPaySetup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[' _id'] = sId;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['activationPin'] = activationPin;
    data['pin_confirmation'] = pinConfirmation;
    data['pin'] = pin;
    data['fullName'] = fullName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['employeeId'] = employeeId;
    data['email'] = email;
    data['bankName'] = bankName;
    data['bankCode'] = bankCode;
    data['jobTitle'] = jobTitle;
    data['bankAccountNumber'] = bankAccountNumber;
    data['isOnboardedOnApp'] = isOnboardedOnApp;
    data['autoPaySetup'] = autoPaySetup;

    return data;
  }

  @override
  String toString() {
    return 'EmployeeData(sId: $sId, name: $name, phoneNumber: $phoneNumber, activationPin: $activationPin, pinConfirmation: $pinConfirmation, pin: $pin, fullName: $fullName, firstName: $firstName, lastName: $lastName, employeeId: $employeeId, email: $email, bankName: $bankName, bankCode: $bankCode, jobTitle: $jobTitle, bankAccountNumber: $bankAccountNumber, isOnboardedOnApp: $isOnboardedOnApp, autoPaySetup: $autoPaySetup)';
  }
}

class StatusResponse {
  String? status;
  String? message;

  StatusResponse({this.status, this.message});

  StatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class DashboardResponse {
  num? balance;
  num? netPay;
  num? earningDays;
  num? remainingDays;
  String? earningPercentage;
  num? totalAccured;
  num? totalAmountWithdrawn;
  List<CompanyInfo>? companyInfo;
  GroupPolicy? groupPolicy;

  DashboardResponse(
      {this.balance,
      this.netPay,
      this.earningDays,
      this.remainingDays,
      this.earningPercentage,
      this.totalAccured,
      this.totalAmountWithdrawn,
      this.companyInfo,
      this.groupPolicy});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    netPay = json['netPay'];
    earningDays = json['earningDays'];
    remainingDays = json['remainingDays'];
    earningPercentage = json['earningPercentage'];
    totalAccured = json['totalAccured'];
    totalAmountWithdrawn = json['totalAmountWithdrawn'];
    if (json['companyInfo'] != null) {
      companyInfo = [];
      json['companyInfo'].forEach((v) {
        companyInfo!.add(CompanyInfo.fromJson(v));
      });
    }
    groupPolicy = json['groupPolicy'] != null
        ? GroupPolicy.fromJson(json['groupPolicy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    data['netPay'] = netPay;
    data['earningDays'] = earningDays;
    data['remainingDays'] = remainingDays;
    data['earningPercentage'] = earningPercentage;
    data['totalAccured'] = totalAccured;
    data['totalAmountWithdrawn'] = totalAmountWithdrawn;
    if (companyInfo != null) {
      data['companyInfo'] = companyInfo!.map((v) => v.toJson()).toList();
    }
    if (groupPolicy != null) {
      data['groupPolicy'] = groupPolicy!.toJson();
    }
    return data;
  }
}

class CompanyInfo {
  bool? autoWithdrawals;
  num? estimatedSalary;
  num? estimatedEmployees;
  String? paymentFee;
  String? sId;
  String? companyName;
  String? employerId;
  String? createdAt;
  String? updatedAt;
  String? address;
  String? invoiceEmail;
  String? rcNumber;
  String? tinNumber;
  num? payrollCutOff;
  num? withdrawalPercent;

  CompanyInfo(
      {this.autoWithdrawals,
      this.estimatedSalary,
      this.estimatedEmployees,
      this.paymentFee,
      this.sId,
      this.companyName,
      this.employerId,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.invoiceEmail,
      this.rcNumber,
      this.tinNumber,
      this.payrollCutOff,
      this.withdrawalPercent});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    autoWithdrawals = json['autoWithdrawals'];
    estimatedSalary = json['estimatedSalary'];
    estimatedEmployees = json['estimatedEmployees'];
    paymentFee = json['paymentFee'];
    sId = json['_id'];
    companyName = json['companyName'];
    employerId = json['employerId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = json['address'];
    invoiceEmail = json['invoiceEmail'];
    rcNumber = json['rcNumber'];
    tinNumber = json['tinNumber'];
    payrollCutOff = json['payrollCutOff'];
    withdrawalPercent = json['withdrawalPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['autoWithdrawals'] = autoWithdrawals;
    data['estimatedSalary'] = estimatedSalary;
    data['estimatedEmployees'] = estimatedEmployees;
    data['paymentFee'] = paymentFee;
    data['_id'] = sId;
    data['companyName'] = companyName;
    data['employerId'] = employerId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['address'] = address;
    data['invoiceEmail'] = invoiceEmail;
    data['rcNumber'] = rcNumber;
    data['tinNumber'] = tinNumber;
    data['payrollCutOff'] = payrollCutOff;
    data['withdrawalPercent'] = withdrawalPercent;
    return data;
  }
}

class GroupPolicy {
  num? limit;
  bool? autoWithdrawals;
  String? employerId;
  String? name;

  GroupPolicy({this.limit, this.autoWithdrawals, this.employerId, this.name});

  GroupPolicy.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    autoWithdrawals = json['autoWithdrawals'];
    employerId = json['employerId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['limit'] = limit;
    data['autoWithdrawals'] = autoWithdrawals;
    data['employerId'] = employerId;
    data['name'] = name;
    return data;
  }
}


class UserDataResponse {
  int status;
  User user;

  UserDataResponse({
    required this.status,
    required this.user,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) => UserDataResponse(
    status: json["status"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "user": user.toJson(),
  };
}

class User {
  String token;
  String userEmail;
  String userNicename;
  String userDisplayName;

  User({
    required this.token,
    required this.userEmail,
    required this.userNicename,
    required this.userDisplayName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    token: json["token"],
    userEmail: json["user_email"],
    userNicename: json["user_nicename"],
    userDisplayName: json["user_display_name"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_email": userEmail,
    "user_nicename": userNicename,
    "user_display_name": userDisplayName,
  };
}
