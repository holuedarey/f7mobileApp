import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'connection_utils.dart';
import 'http_error_strings.dart';

class HttpUtils {
  static final BaseOptions options = BaseOptions(
    connectTimeout: 999990,
    receiveTimeout: 89250,
  );

  static Dio getInstance() {
    Dio dio = Dio(options)
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          error: true,
          maxWidth: 90));
    return dio;
  }

  static Future<DioError> buildErrorResponse(DioError err) async {
    RequestOptions requestOptions = RequestOptions(path: "");

    switch (err.type) {
      case DioErrorType.connectTimeout:
        if (await ConnectionUtils.getActiveStatus()) {
          err.response = Response(
              data: HttpErrorStrings.CONNECTION_TIMEOUT_ACTIVE,
              requestOptions: requestOptions);
        } else {
          err.response = Response(
              data: HttpErrorStrings.CONNECTION_TIMEOUT_NOT_ACTIVE,
              requestOptions: requestOptions);
        }
        break;
      case DioErrorType.sendTimeout:
        err.response = Response(
            data: HttpErrorStrings.SEND_TIMEOUT,
            requestOptions: requestOptions);
        break;
      case DioErrorType.receiveTimeout:
        err.response = Response(
            data: HttpErrorStrings.RECEIVE_TIMEOUT,
            requestOptions: requestOptions);
        break;
      case DioErrorType.response:
        if (err.response!.statusCode == HttpStatus.badRequest) {

          err.response = Response(
              data: err.response!.data['message'].toString(),
              requestOptions: requestOptions);
        } else {
          err.response = Response(
              data: HttpErrorStrings.BAD_RESPONSE,
              requestOptions: requestOptions);
        }
        break;
      case DioErrorType.cancel:
        err.response = Response(
            data: HttpErrorStrings.OPERATION_CANCELLED,
            requestOptions: requestOptions);
        break;
      case DioErrorType.other:
        if (!await ConnectionUtils.getActiveStatus()) {
          err.response = Response(
              data: HttpErrorStrings.DEFAULT, requestOptions: requestOptions);
        } else {
          err.response = Response(
              data: HttpErrorStrings.BAD_RESPONSE,
              requestOptions: requestOptions);
        }
        break;
      default:
        err.response = Response(
            data: HttpErrorStrings.UNKNOWN, requestOptions: requestOptions);
        break;
    }

    return err;
  }
}
