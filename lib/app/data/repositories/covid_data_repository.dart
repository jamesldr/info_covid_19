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
          "city_ibge_code": ""
        },
      );

      return DataModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.response.toString());
    }
  }
}
