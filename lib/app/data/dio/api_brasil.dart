import 'package:dio/dio.dart';

import 'intercerptor/api_interceptor.dart';

class ApiBrasil {
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
