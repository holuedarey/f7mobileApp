import 'package:dio/dio.dart';

import '../configurations/http_utils/http_utils.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(
      DioError err, ErrorInterceptorHandler errorInterceptorHandler) async {
    err = await HttpUtils.buildErrorResponse(err);
    super.onError(err, errorInterceptorHandler);
    return err;
  }
}
