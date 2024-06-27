// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// import '../../models/secret/secret_model.dart';
// import '../configurations/http_utils/connection_utils.dart';
// import '../configurations/http_utils/http_error_strings.dart';
//
// enum GrantType { Credential, Password }
//
// class TokenInterceptor extends Interceptor {
//   final GrantType grantType;
//
//   TokenInterceptor(this.grantType);
//
//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     options.data = buildParameters(options.data);
//     super.onRequest(options, handler);
//     return options;
//   }
//
//   RequestOptions requestOptions = RequestOptions(path: "");
//
//   Map<String, dynamic>? buildParameters(Map<String, dynamic> data) {
//     if (grantType == GrantType.Password) {
//       return data
//         ..addAll({
//           'client_id': 'client',
//           'client_secret': 'secret',
//           'grant_type': 'password',
//         });
//     }
//     return {
//       'client_id': 'client',
//       'client_secret': 'secret',
//       'grant_type': 'client_credentials',
//     };
//   }
//
//   @override
//   Future onResponse(
//       Response response, ResponseInterceptorHandler handler) async {
//     if (response.statusCode == HttpStatus.ok) {
//       SecretModel secretModel = SecretModel.fromJson(response.data);
//       response.data = secretModel;
//     }
//     super.onResponse(response, handler);
//
//     return response;
//   }
//
//   @override
//   Future onError(
//       DioError err, ErrorInterceptorHandler errorInterceptorHandler) async {
//     switch (err.type) {
//       case DioErrorType.connectTimeout:
//         if (await ConnectionUtils.getActiveStatus()) {
//           err.response = Response(
//               data: HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE,
//               requestOptions: requestOptions);
//         } else {
//           err.response = Response(
//               data: HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE,
//               requestOptions: requestOptions);
//         }
//         break;
//       case DioErrorType.sendTimeout:
//         err.response = Response(
//             data: HttpErrorStrings.SEND_TIMEOUT,
//             requestOptions: requestOptions);
//         break;
//       case DioErrorType.receiveTimeout:
//         err.response = Response(
//             data: HttpErrorStrings.RECEIVE_TIMEOUT,
//             requestOptions: requestOptions);
//         break;
//
//       case DioErrorType.response:
//         if (err.response!.statusCode == HttpStatus.unauthorized) {
//           err.response = Response(
//               data: HttpErrorStrings.UnAuthorized,
//               requestOptions: requestOptions);
// //          err.response = Response(data: err.response.data.toString());
// //          Map<String, dynamic> errorResponse = err.response.data;
// //          err.response = Response(data: errorResponse['error']);
//         } else {
//           err.response = Response(
//               data: err.response!.data['message'],
//               requestOptions: requestOptions);
// //          err.response = Response(data: err.error);
//         }
//         break;
//
//       case DioErrorType.response:
//         if (err.response!.statusCode == HttpStatus.badRequest) {
//           Map<String, dynamic> errorResponse = err.response!.data;
//           err.response = Response(
//               data: errorResponse['error_description'],
//               requestOptions: requestOptions);
//         } else {
//           err.response = Response(
//               data: HttpErrorStrings.DEFAULT, requestOptions: requestOptions);
//         }
//         break;
//
//       case DioErrorType.cancel:
//         err.response = Response(
//             data: HttpErrorStrings.OPERATION_CANCELLED,
//             requestOptions: requestOptions);
//         break;
//       case DioErrorType.other:
//         if (!await ConnectionUtils.getActiveStatus()) {
//           err.response = Response(
//               data: HttpErrorStrings.DEFAULT, requestOptions: requestOptions);
//         } else {
//           err.response = Response(
//               data: HttpErrorStrings.DEFAULT, requestOptions: requestOptions);
//         }
//         break;
//       default:
//         err.response =
//             Response(data: err.message, requestOptions: requestOptions);
//         break;
//     }
//     super.onError(err, errorInterceptorHandler);
//     return err;
//   }
// }
