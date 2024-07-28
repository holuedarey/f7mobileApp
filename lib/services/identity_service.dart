import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

import '../../models/error_model.dart';
import '../../models/secret/secret_model.dart';
import '../models/registration/user_otp_response.dart';
import '../common/configurations/app_config.dart';
import '../common/configurations/http_utils/http_utils.dart';
import '../common/configurations/urls.dart';
import '../common/interceptors/error_interceptor.dart';
import '../common/interceptors/request_interceptor.dart';

/// IDENTITY ENDPOINTS
const String sendOTP = 'Users/senduserotp';
const String verifyuserOtp = 'validate-code';
const String registerUser = 'account/register';
const String authPhoneLogin = 'Account/Phonelogin';
const String facebookAuthLogin = 'Account/facebooklogin';
const String googleAuthLogin = 'Account/googlelogin';
const String forgetPassword = 'forget-password';
const String changePassword = 'Account/changepassword';
const String verifyOTPPassword = 'Account/verifyresetpasswordOTP';
const String resetPassword = 'Account/resetpassword';


const String CheckPhoneNumber = 'user-management/employee/send-activation-pin';
const String SetLoginPin = 'user-management/employee/set-login-pin';
const String SetPersonalInfo = 'user-management/employee/update-personal-info';
const String UpdateBankAccount = 'user-management/employee/update-bank-account';
const String SendResetPin = 'user-management/employee/send-reset-pin';
const String UpdateLoginPin = 'user-management/employee/update-login-pin';
const String WithdrawEarning = 'employee-operations/withdraw-earnings';
const String GetBankList = 'miscellaneous/get-bank-list';
const String GetDashboardRecord = 'employee-operations/dashboard';
const String GetTransactions = 'employee-operations/get-earnings';
const String GetWithdrawals = 'employee-operations/get-withdrawals';
const String AccountPasswordChange = '/api/account/password/change/';
const String PasswordForgot = '/api/Account/forgotPassword/agent';
const String PasswordByPhoneNumber = '/api/Account/password/forgotpasswordbyphonenumber';
const String ResetPassword = '/api/Account/password/resetpasswordbyotp';
const String ActivateAccount = '/api/Auth/activate/';


const String loginEndpoint = 'token';
const String verifyInviteEndpoint = 'account/invitation/verify';
const String registerEndpoint = 'register';
const String createAccessPinEndpoint = 'accesspin/create';
const String resetPasswordEndpoint = 'reset-password';
const String forgotPasswordEndpoint = 'forgot-password';
const String createAccountEndpoint = 'profile';

// miscellaneous/get-bank-list
class IdentityService {
  static final sendOTPBaseUrl = HantspolUrls.getUrl(AppConfig.instance.flavor, HantspolUrl.sendOTP);
  static final baseUrl = HantspolUrls.getUrl(AppConfig.instance.flavor, HantspolUrl.identity);


  static Future<Tuple2<UserOtpResponse?, String?>> sendOTPRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = sendOTPBaseUrl! + sendOTP;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      if (response.data['data'] != null) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }

  static Future<Tuple2<UserOtpResponse?, String?>> verifyUserOTPRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = sendOTPBaseUrl! + verifyuserOtp;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      print(response);
      if (response.data['data'] != null) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }


  static Future<Tuple2<InvitationResponse?, String?>> verifyInvitationRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + verifyInviteEndpoint;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      // ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      if (response.data['data'] != null) {
        final InvitationResponse invitationResponse = InvitationResponse.fromJson(response.data['data']);
        return Tuple2(invitationResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data["message"]);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }



  static Future<Tuple2<RegisterUserResponse?, String?>> registerUserRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + registerEndpoint;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      // ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json"
        }),
        data: parameters,
      );

      if (response.data['data'] != null) {
        final RegisterUserResponse userOtpResponse = RegisterUserResponse.fromJson(response.data['data']);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data["message"]);
    }
  }


  static Future<Tuple2<CreateAccountResponse?, String?>> createAccountProfileRequest(
      {required Map<String, dynamic> parameters, required String tenantId, required String  token}) async {
    final url =  baseUrl! + createAccountEndpoint;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      // RequestInterceptor(),
      // ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
          "tenant-id":tenantId,
          "Authorization":"Bearer $token",
        }),
        data: parameters,
      );

      if (response.data['data'] != null) {
        final CreateAccountResponse accountResponse = CreateAccountResponse.fromJson(response.data['data'] );
        return Tuple2(accountResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }


  static Future<Tuple2<CreateAccessPinResponse?, String?>> createAccessPinRequest(
      {required Map<String, dynamic> parameters, required String tenantId, required String  token}) async {
    final url =  baseUrl! + createAccessPinEndpoint;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      // RequestInterceptor(),
      // ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
          "tenant-id":tenantId,
          "Authorization":"Bearer $token",
        }),
        data: parameters,
      );

      if (response.data['isError'] == false) {
        final CreateAccessPinResponse accountResponse = CreateAccessPinResponse.fromJson(response.data );
        return Tuple2(accountResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data["message"]);
    }
  }


 static Future<Tuple2<UserDataResponse?, String?>> loginEmailUser(BuildContext context,
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + loginEndpoint;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType: Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );
      if (response.data['data'] != null) {
        final UserDataResponse userDataResponse = UserDataResponse.fromJson(response.data['data']);
        return Tuple2(userDataResponse, null);
      }  else {
        return Tuple2(null, response.data["message"]);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data["message"]);
    }
  }





  static Future<Tuple2<UserOtpResponse?, String?>> forgetPasswordRequest(
      {required String email}) async {
    final url = '${baseUrl!}$forgetPassword';


    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: {'email' : email},
      );

      if (response.data['data'] != null) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data['data'] );
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }

  static Future<Tuple2<UserOtpResponse?, String?>> verifyPasswordOTPRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = sendOTPBaseUrl! + verifyOTPPassword;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      if (response.data['data'] != null) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }

  static Future<Tuple2<UserOtpResponse?, String?>> resetPasswordRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = sendOTPBaseUrl! + resetPassword;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      if (response.data['requestSuccessful'] == true) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }
  static Future<Tuple2<UserOtpResponse?, String?>> changePasswordRequest(
      {required String userId,required Map<String, dynamic> parameters}) async {
    final url = '${baseUrl!}$changePassword?userId=$userId';
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([
      RequestInterceptor(),
      ErrorInterceptor(),
    ]);

    try {
      Response response = await dio.post(
        url,
        options:
        Options(contentType:Headers.jsonContentType, headers: {
          "Accept": "application/json",
        }),
        data: parameters,
      );

      if (response.data['requestSuccessful'] == true) {
        final UserOtpResponse userOtpResponse = UserOtpResponse.fromJson(response.data);
        return Tuple2(userOtpResponse, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }



  // static Future<Tuple2<String?, String?>> checkPhoneNumberExist(
  //     BuildContext context,
  //     {required Map<String, dynamic> parameters}) async {
  //   final url = baseUrl! + CheckPhoneNumber;
  //   final dio = HttpUtils.getInstance();
  //   dio.interceptors.add(RequestInterceptor());
  //
  //   try {
  //     Response response = await dio.post(
  //       url,
  //       options:
  //           Options(contentType: Headers.formUrlEncodedContentType, headers: {
  //         "Accept": "application/json",
  //       }),
  //       data: parameters,
  //     );
  //     if (response.data['status'] == "success") {
  //       return Tuple2(response.data['status'], null);
  //     } else {
  //       return Tuple2(null, response.data["message"]);
  //     }
  //   } on DioError catch (e) {
  //        return Tuple2(null, e.response?.data["message"]);
  //   }
  // }
  //


  static Future<Tuple2<String?, String?>> setPersonalInfo(BuildContext context,
      {required Map<String, dynamic> parameters, required token}) async {
    final url = baseUrl! + SetPersonalInfo;
    final dio = HttpUtils.getInstance();
    dio.interceptors.add(RequestInterceptor());

    try {
      Response response = await dio.post(
        url,
        options: Options(contentType: Headers.jsonContentType, headers: {
          HttpHeaders.authorizationHeader: token,
        }),
        data: parameters,
      );

      if (response.data['status'] == "success") {
        return Tuple2(response.data['status'], null);
      } else {
        return Tuple2(null, response.data["message"]);
      }
    } on DioError catch (e) {
         return Tuple2(null, e.response?.data["message"]);
    }
  }


  ///
  /// Upload Profile Image to Conf-base /api/FileManager/UploadFiles
  /// Form Data
  ///  required parameters {
  ///   'file' : base64Encode(file.readAsBytesSync())
  ///   }
  ///
  /// return {
  ///   "fileName": "string"
  ///   }
  ///
  // static Future<UploadFileModel> uploadFile(BuildContext context,
  //     {@required File file, @required String fileName}) async {
  //   final url = baseUrl + fileManagerUploadFile;
  //
  //   final dio = HttpUtils.getInstance();
  //   dio.interceptors.add(RequestInterceptor());
  //   dio.interceptors.add(UploadFileInterceptor());
  //
  //   try {
  //     FormData formData = FormData.fromMap({
  //       'file': await MultipartFile.fromFile(file.path, filename: fileName),
  //     });
  //     Response response = await dio.post(url, data: formData);
  //
  //     if (response.data is UploadFileModel) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     BlocProvider.of<ResultHandlerBloc>(context)
  //         .add(ResultHandlerEventShowError(message: e.response.data));
  //   }
  //   return null;
  // }

}
