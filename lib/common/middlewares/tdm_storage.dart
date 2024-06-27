import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:f7apparel_mobile/models/secret/secret_model.dart';
import '../../models/registration/user_otp_response.dart';
import '../../models/secret/secret_model.dart';
import '../configurations/tdm_strings.dart';


class HantspolStorage {
  static final HantspolStorage _instance = HantspolStorage._internal();
  factory HantspolStorage.getInstance() {
    return _instance;
  }
  final _storage =  const FlutterSecureStorage();
  HantspolStorage._internal();

  String? response;

///CreateAccountResponse
  Future<void> createAccountResponseData(CreateAccountResponse? accountResponse) async {
    Map<String, dynamic> agentParams = accountResponse!.toJson();
    String mapToStr = json.encode(agentParams);
    await _storage.write(key: TDMStrings.accountResponse, value: mapToStr);
  }

  Future<CreateAccountResponse?> getAccountResponseData() async {
    Map<String, dynamic>? parameters;
    response = await _storage.read(key: TDMStrings.accountResponse);
    if (response != null) {
      parameters = json.decode(response!);
      return CreateAccountResponse.fromJson(parameters!);
    }

    return null;
  }

  Future<void> createUserData(UserDataResponse userDataResponse) async {
    Map<String, dynamic> agentParams = userDataResponse.toJson();
    String mapToStr = json.encode(agentParams);
    await _storage.write(key: TDMStrings.userDataResponse, value: mapToStr);
  }

  Future<UserDataResponse?> getUserData() async {
    Map<String, dynamic>? parameters;
    response = await _storage.read(key: TDMStrings.userDataResponse);
    if (response != null) {
      parameters = json.decode(response!);
      return UserDataResponse.fromJson(parameters!);
    }

    return null;
  }

  Future<void> deleteAllUser() async {
    await _storage.delete(key: TDMStrings.userDataResponse);
    return;
  }




  Future<void> createUser(User user) async {
    Map<String, dynamic> agentParams = user.toJson();
    String mapToStr = json.encode(agentParams);
    await _storage.write(key: TDMStrings.userResponse, value: mapToStr);
  }

  Future<User?> getUser() async {
    Map<String, dynamic>? parameters;
    response = await _storage.read(key: TDMStrings.userResponse);
    if (response != null) {
      parameters = json.decode(response!);
      return User.fromJson(parameters!);
    }

    return null;
  }



  Future<void> updateUser(UserDetail user) async {
    Map<String, dynamic> agentParams = user.toJson();
    String mapToStr = json.encode(agentParams);
    await _storage.write(key: TDMStrings.userName, value: mapToStr);
  }

  Future<void> createObject(UserDetail user) async {
    Map<String, dynamic> agentParams = user.toJson();
    String mapToStr = json.encode(agentParams);
    await _storage.write(key: TDMStrings.userName, value: mapToStr);
  }

  ///
  Future<void> insertSecurityObject(dynamic params) async {
    await _storage.write(key: TDMStrings.userName, value: params);
  }

  Future<void> insertPinObject(String params) async {
    // String mapToStr = json.encode(params);
    await _storage.write(key: TDMStrings.userName, value: params);
  }

  Future<void> insertObject(dynamic params) async {
    // String mapToStr = json.encode(params);
    await _storage.write(key: TDMStrings.obj, value: params);
  }

  Future<void> insertEmail(String params) async {
    await _storage.write(key: TDMStrings.emailAddress, value: params);
  }

  Future<void> insertOrganizationId(String params) async {
    await _storage.write(key: TDMStrings.organizationId, value: params);
  }

  Future<void> insertPassword(String params) async {
    await _storage.write(key: TDMStrings.password, value: params);
  }


  Future<void> insertPhoneNumber(String params) async {
    await _storage.write(key: TDMStrings.phoneNumber, value: params);
  }

  Future<void> insertAccessPin(String params) async {
    await _storage.write(key: TDMStrings.accessPin, value: params);
  }

  Future<void> insertLoginParam(dynamic params) async {
    // String mapToStr = json.encode(params);
    await _storage.write(key: TDMStrings.userName, value: params);
  }

  Future<void> insertAgentId(String params) async {
    await _storage.write(key: TDMStrings.userName, value: params);
  }

  Future<void> insertFirstName(String params) async {
    await _storage.write(key: TDMStrings.firstName, value: params);
  }

  Future<String?> getAccessPin() async {
    String? value = await _storage.read(key: TDMStrings.accessPin);
    return value;
  }

  Future<String?> getObject() async {
    String? value = await _storage.read(key: TDMStrings.obj);
    return value;
  }

  // Future<String> getLocationObject() async {
  //   String value = await _storage.read(key: EarnipayStrings.locationObject);
  //   return value;
  // }

  Future<String?> getEmail() async {
    String? value = await _storage.read(key: TDMStrings.emailAddress);
    return value;
  }

  Future<String?> getPassword() async {
    String? value = await _storage.read(key: TDMStrings.password);
    return value;
  }

  Future<String?> getLoginParam() async {
    String? value = await _storage.read(key: TDMStrings.userName);
    return value;
  }

  Future<String?> getAgentId() async {
    String? value = await _storage.read(key: TDMStrings.userName);
    return value;
  }

  Future<String?> getPhoneNumber() async {
    String? value = await _storage.read(key: TDMStrings.phoneNumber);
    return value;
  }

  Future<String?> getUserName() async {
    String? value = await _storage.read(key: TDMStrings.userName);
    return value;
  }

}
