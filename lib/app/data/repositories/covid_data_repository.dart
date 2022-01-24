import 'package:dio/dio.dart';

import '../models/data_model.dart';

class CovidDataRepository {
  final Dio _client;
  CovidDataRepository(this._client);

  Future<DataModel> fetchData({int? page}) async {
    try {
      final response = await _client.get(
        '/v1/dataset/covid19/caso/data/',
        queryParameters: {
          "search": "",
          "date": "",
          "place_type": "state",
          "is_last": "",
          "city_ibge_code": "",
          "page_size": 100
        },
      );

      return DataModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response.toString());
    }
  }

  Future<DataModel> fetchDataByState({String? sigla}) async {
    try {
      final response = await _client.get(
        '/v1/dataset/covid19/caso/data/',
        queryParameters: {
          "search": "",
          "place_type": "state",
          "state": sigla,
          "is_last": "True",
        },
      );

      return DataModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response.toString());
    }
  }

  Future<DataModel> fetchLast30DaysDataByState({String? sigla}) async {
    try {
      final response = await _client.get(
        '/v1/dataset/covid19/caso/data/',
        queryParameters: {
          "search": "",
          "place_type": "state",
          "state": sigla,
          "is_last": "",
          "page_size": "31"
        },
      );

      return DataModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response.toString());
    }
  }
}
