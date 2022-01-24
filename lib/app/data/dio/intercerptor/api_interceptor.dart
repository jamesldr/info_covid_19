import 'package:dio/dio.dart';
import 'package:estatisticas_covid/shared/utils/debug_logger.dart';
import 'package:flutter/foundation.dart';

class ApiInterceptors extends Interceptor {
  final logger = DebugLogger();
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      logger(options.method + ' ' + options.uri.toString());
      logger('body: ' + options.data.toString());
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
