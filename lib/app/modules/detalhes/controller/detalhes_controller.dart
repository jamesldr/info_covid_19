import 'dart:math';

import 'package:estatisticas_covid/app/data/dio/api_brasil.dart';
import 'package:estatisticas_covid/app/data/repositories/covid_data_repository.dart';
import 'package:estatisticas_covid/shared/entities/graph_model.dart';
import 'package:estatisticas_covid/shared/utils/debug_logger.dart';
import 'package:estatisticas_covid/shared/utils/formatter.dart';
import 'package:mobx/mobx.dart';
part 'detalhes_controller.g.dart';

class DetalhesController = _DetalhesControllerBase with _$DetalhesController;
enum DetalhesState { initial, loading, done }

abstract class _DetalhesControllerBase with Store {
  final _logger = DebugLogger();
  @observable
  DetalhesState state = DetalhesState.initial;

  @observable
  String? date;

  @observable
  String? confirmed;

  @observable
  String? deaths;

  @observable
  String? population;

  @observable
  ObservableList<GraphModel>? graphConfirmed;

  @observable
  ObservableList<GraphModel>? graphDeaths;

  @action
  populate({required String sigla}) async {
    final _client = ApiBrasil().init();
    final _repository = CovidDataRepository(_client);
    await _populateStatus(_repository, sigla);
    await _populateGraphs(_repository, sigla);
  }

  _populateStatus(CovidDataRepository repo, String sigla) async {
    final _model = (await repo.fetchDataByState(sigla: sigla)).results?[0];
    date = Formatter.displayDate(_model?.date);
    population = _model?.estimatedPopulation.toString();
    confirmed = (_model?.confirmed ?? '').toString();
    deaths = (_model?.deaths ?? '').toString();
    _logger(date);
  }

  _populateGraphs(CovidDataRepository repo, String sigla) async {
    var x = await repo.fetchLast30DaysDataByState(sigla: sigla);

    graphConfirmed = (x.results ?? [])
        .map(
          (e) => GraphModel(value: e.confirmed!, date: DateTime.parse(e.date!)),
        )
        .toList()
        .asObservable();

    graphDeaths = (x.results ?? [])
        .map((e) => GraphModel(value: e.deaths!, date: DateTime.parse(e.date!)))
        .toList()
        .asObservable();
  }
}
