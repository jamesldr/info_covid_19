import 'package:dio/dio.dart';
import 'package:estatisticas_covid/shared/utils/debug_logger.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = 'https://api.brasil.io';
    _dio.options.headers = {
      "Authorization": "Token 8b34c604f8c467c5950550f6870bde20dc5229fb",
    };
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  final logger = DebugLogger();
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      logger(options.method + '  ' + options.uri.toString());
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onError(
      DioError err, ErrorInterceptorHandler handler) async {}

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      logger(response.data);
    }
    return super.onResponse(response, handler);
  }
}
