// import 'dart:io';
// import 'package:dio/dio.dart';
//
// import '../../models/result/result_model.dart';
//
//
// class ResultInterceptor extends Interceptor {
//   static const BAD_REQUEST_STATUS_MESSAGE = "BAD REQUEST";
//   RequestOptions requestOptions = RequestOptions(path: "");
//
//   @override
//   Future onResponse(Response response,
//       ResponseInterceptorHandler responseInterceptorHandler) async {
//     if (response.statusCode == HttpStatus.ok) {
//       ResultModel resultModel = ResultModel.fromJson(response.data);
//       if (resultModel.successful!) {
//         response.data = resultModel.result;
//         return response;
//       } else {
//         String? message;
//         if (resultModel.resultType == 2) {
//           message = resultModel.message;
//         } else {
//           message = resultModel.validationMessages!.join("");
//         }
//         super.onResponse(response, responseInterceptorHandler);
//         return DioError(
//             response: Response(
//                 data: message,
//                 statusCode: HttpStatus.badRequest,
//                 statusMessage: BAD_REQUEST_STATUS_MESSAGE,
//                 requestOptions: requestOptions),
//             type: DioErrorType.response,
//             error: message,
//             requestOptions: requestOptions);
//       }
//     }
//   }
// }
