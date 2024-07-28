import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:f7apparel_mobile/models/product_list/product_list.dart';
import 'package:f7apparel_mobile/models/product_list/top_brand.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:tuple/tuple.dart';

import '../../models/error_model.dart';
import '../common/configurations/app_config.dart';
import '../common/configurations/http_utils/http_utils.dart';
import '../common/configurations/urls.dart';
import '../common/interceptors/request_interceptor.dart';

/// IDENTITY ENDPOINTS
const String product = 'products-search?per_page=10';
const String topBrand = 'top-month-brands';
const String topCategories = 'top-categories';

// miscellaneous/get-bank-list
class ProductService {
  static final baseUrl =
      HantspolUrls.getUrl(AppConfig.instance.flavor, HantspolUrl.identity);

  // Global options
  static final options = CacheOptions(
    // A default store is required for interceptor.
    store: MemCacheStore(),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.request,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: Duration(hours: 1),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  static Future<Tuple2<List<ProductModel>?, String?>> getProductList(
      BuildContext context,
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + product;
    final dio = HttpUtils.getInstance();
    dio.interceptors
        .addAll([RequestInterceptor(), DioCacheInterceptor(options: options)]);

    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType, headers: {
          // HttpHeaders.authorizationHeader: token,
        }),
      );
      if (response.data != null) {
        List result = response.data;

        List<ProductModel> products =
            result.map((product) => ProductModel.fromJson(product)).toList();

        return Tuple2(products, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data['message']);
    }
  }

  static Future<Tuple2<List<ProductModel>?, String?>> getArrivalProductList(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + product;
    final dio = HttpUtils.getInstance();
    dio.interceptors.addAll([RequestInterceptor(), DioCacheInterceptor(options: options)]);
    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType, headers: {
          // HttpHeaders.authorizationHeader: token,
        }),
      );
      if (response.data != null) {
        List result = response.data;

        List<ProductModel> products =
            result.map((product) => ProductModel.fromJson(product)).toList();

        return Tuple2(products, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data['message']);
    }
  }


  static Future<Tuple2<List<ProductModel>?, String?>> getFeaturedProductList(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + product;
    final dio = HttpUtils.getInstance();

    dio.interceptors.addAll([RequestInterceptor(), DioCacheInterceptor(options: options)]);
    try {
      Response response = await dio.get(
        url,
        options: Options(contentType: Headers.jsonContentType, headers: {
          // HttpHeaders.authorizationHeader: token,
        }),
      );
      if (response.data != null) {
        List result = response.data;

        List<ProductModel> products =
            result.map((product) => ProductModel.fromJson(product)).toList();

        return Tuple2(products, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data['message']);
    }
  }

  static Future<Tuple2<List<TopBrandModel>?, String?>> getTopBrand(
      {required Map<String, dynamic> parameters}) async {
    final url = baseUrl! + topBrand;
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
        List result = response.data['data']['data'];
        List<TopBrandModel> allBrand =
            result.map((brand) => TopBrandModel.fromJson(brand)).toList();
        ;
        return Tuple2(allBrand, null);
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(response.data);
        return Tuple2(null, errorModel.message);
      }
    } on DioError catch (e) {
      return Tuple2(null, e.response?.data['message']);
    }
  }
}
