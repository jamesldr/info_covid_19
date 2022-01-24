import 'package:dio/dio.dart';

import 'intercerptor/api_interceptor.dart';

class ApiIbge {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = 'https://servicodados.ibge.gov.br/api/v1/';

    return _dio;
  }
}
