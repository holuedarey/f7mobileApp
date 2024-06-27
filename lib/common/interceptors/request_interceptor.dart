import 'dart:io';
import 'package:dio/dio.dart';

import '../middlewares/token_repository.dart';

enum RequestType { Token, None }

class RequestInterceptor extends Interceptor {
  final RequestType requestType;

  RequestInterceptor([this.requestType = RequestType.Token]);

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler requestInterceptorHandler,
  ) async {
    String? bearerToken =
        await TokenRepository.getInstance().getToken(TokenType.ACCESS);
    if (requestType == RequestType.Token) {
      options.headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      });
    }
    super.onRequest(options, requestInterceptorHandler);
    return options;
  }
}
