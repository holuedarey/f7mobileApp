// import 'dart:io';
// import 'package:dio/dio.dart';
// import '../../models/count/count_model.dart';
// import '../middlewares/token_repository.dart';
//
//
// class CountInterceptor extends Interceptor {
//   @override
//   Future onRequest(RequestOptions options,
//       RequestInterceptorHandler responseHandler) async {
//     String? bearerToken =
//         await TokenRepository.getInstance().getToken(TokenType.ACCESS);
//     options.headers = {
//       HttpHeaders.authorizationHeader: bearerToken,
//     };
//     super.onRequest(options, responseHandler);
//     return options;
//   }
//
//   @override
//   Future onResponse(Response response,
//       ResponseInterceptorHandler responseHandler) async {
//     if (response.statusCode == HttpStatus.ok) {
//       CountModel countModel = CountModel.fromJson(response.data);
//       response.data = countModel.items;
//       super.onResponse(response, responseHandler);
//       return response;
//     }
//   }
// }
