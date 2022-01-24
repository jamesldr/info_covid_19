import 'package:estatisticas_covid/app/data/dio/api_ibge.dart';
import 'package:estatisticas_covid/app/data/models/estado_model.dart';
import 'package:estatisticas_covid/app/data/repositories/ibge_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

enum HomeState { initial, loading, done }

abstract class _HomeControllerBase with Store {
  _HomeControllerBase() {
    Future.microtask(() async => await populate());
  }
  final _repository = IbgeRepository(ApiIbge().init());
  @observable
  HomeState state = HomeState.initial;

  @observable
  ObservableList<EstadoModel>? estados;

  @action
  _setState(HomeState s) => state = s;

  @action
  populate() async {
    _setState(HomeState.loading);
    estados = (await _repository.fetchEstados()).asObservable();
    _setState(HomeState.done);
    _setState(HomeState.initial);
  }
}
