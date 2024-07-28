import 'package:dio/dio.dart';
import 'package:f7apparel_mobile/models/error_model.dart';
import 'package:tuple/tuple.dart';

import '../common/configurations/app_config.dart';
import '../common/configurations/http_utils/http_utils.dart';
import '../common/configurations/urls.dart';
import '../common/interceptors/request_interceptor.dart';
import '../models/journal/get_icons_response.dart';
import '../models/journal/journal_history_response.dart';

const String getIcons = 'journal/icons';
const String journalHistoryEndPoint = 'journal';
const String createJournal = 'journal/create';
const String deleteJournalItem = 'journal/';
const itemsPerPage = 150;

class JournalService {
  static final baseUrl = HantspolUrls.getUrl(
    AppConfig.instance.flavor,
    HantspolUrl.identity,
  );

  Dio dio = HttpUtils.getInstance()..interceptors.add(RequestInterceptor());

  static Future<Tuple2<List<Emotions>?, String?>> getIconsRequest()async {
    final url = baseUrl! + getIcons;
    final dio = HttpUtils.getInstance();
    dio.interceptors.add(RequestInterceptor());

    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType, headers: {
          // HttpHeaders.authorizationHeader: token,
        }),
      );

      if (response.data != null) {
        List result = response.data['data'];
        List<Emotions> emotions = result.map((emotion) => Emotions.fromJson(emotion)).toList();
        return Tuple2(emotions, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data['message']);
    }
  }


  Future<EmotionsResponse> deleteJournalByUId(String? journalId) async {
    https://hantspol-api-dev-5f03fb9625da.herokuapp.com/api/v1/journal/8014d2aa-3033-4f43-b023-4eed965b013a
    final url = "$baseUrl$deleteJournalItem$journalId";
    try {
      Response response = await dio.delete(url);
      if (response.data == null) throw "No data";
      return EmotionsResponse.fromJson(response.data);
    } on DioError catch (e) {
      if(e.response?.statusCode == 400){
        return EmotionsResponse.fromJson(e.response?.data);
      }
      throw e.response?.data['message'] ?? "An error occurred.";
    }
  }



  Future<JournalHistoryResponse> getJournalHistory(
      {int page = 1, isPast}) async {
    final url = "$baseUrl$journalHistoryEndPoint";
    // Map<String, dynamic> query = {"page": page, "per_page": {}, "is_past":isPast};
    Map<String, dynamic> query = {
      "page": page,
      "per_page": itemsPerPage,
      "is_past": isPast
    };
    try {
      Response response = await dio.get(url, queryParameters: query);
      if (response.data == null) throw "No data";
      return JournalHistoryResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw e.response?.data['message'] ?? "An error occurred.";
    }
  }

  static Future<Tuple2<bool?, String?>> createJournalRequest(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + createJournal;
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
        return const Tuple2(true, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data["message"]);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data["message"]);
    }
  }
}
