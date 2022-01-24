import 'package:dio/dio.dart';
import 'package:estatisticas_covid/app/data/models/estado_model.dart';

class IbgeRepository {
  final Dio _client;
  IbgeRepository(this._client);

  Future<List<EstadoModel>> fetchEstados() async {
    try {
      final response = await _client.get(
        '/localidades/estados',
        queryParameters: {
          "orderBy": "nome",
        },
      );

      return (response.data as List)
          .map((e) => EstadoModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.response.toString());
    }
  }
}
