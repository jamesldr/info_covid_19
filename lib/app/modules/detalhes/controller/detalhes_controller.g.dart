// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesController on _DetalhesControllerBase, Store {
  final _$stateAtom = Atom(name: '_DetalhesControllerBase.state');

  @override
  DetalhesState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DetalhesState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$dateAtom = Atom(name: '_DetalhesControllerBase.date');

  @override
  String? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$confirmedAtom = Atom(name: '_DetalhesControllerBase.confirmed');

  @override
  String? get confirmed {
    _$confirmedAtom.reportRead();
    return super.confirmed;
  }

  @override
  set confirmed(String? value) {
    _$confirmedAtom.reportWrite(value, super.confirmed, () {
      super.confirmed = value;
    });
  }

  final _$deathsAtom = Atom(name: '_DetalhesControllerBase.deaths');

  @override
  String? get deaths {
    _$deathsAtom.reportRead();
    return super.deaths;
  }

  @override
  set deaths(String? value) {
    _$deathsAtom.reportWrite(value, super.deaths, () {
      super.deaths = value;
    });
  }

  final _$populationAtom = Atom(name: '_DetalhesControllerBase.population');

  @override
  String? get population {
    _$populationAtom.reportRead();
    return super.population;
  }

  @override
  set population(String? value) {
    _$populationAtom.reportWrite(value, super.population, () {
      super.population = value;
    });
  }

  final _$graphConfirmedAtom =
      Atom(name: '_DetalhesControllerBase.graphConfirmed');

  @override
  ObservableList<GraphModel>? get graphConfirmed {
    _$graphConfirmedAtom.reportRead();
    return super.graphConfirmed;
  }

  @override
  set graphConfirmed(ObservableList<GraphModel>? value) {
    _$graphConfirmedAtom.reportWrite(value, super.graphConfirmed, () {
      super.graphConfirmed = value;
    });
  }

  final _$graphDeathsAtom = Atom(name: '_DetalhesControllerBase.graphDeaths');

  @override
  ObservableList<GraphModel>? get graphDeaths {
    _$graphDeathsAtom.reportRead();
    return super.graphDeaths;
  }

  @override
  set graphDeaths(ObservableList<GraphModel>? value) {
    _$graphDeathsAtom.reportWrite(value, super.graphDeaths, () {
      super.graphDeaths = value;
    });
  }

  final _$populateAsyncAction = AsyncAction('_DetalhesControllerBase.populate');

  @override
  Future populate({required String sigla}) {
    return _$populateAsyncAction.run(() => super.populate(sigla: sigla));
  }

  @override
  String toString() {
    return '''
state: ${state},
date: ${date},
confirmed: ${confirmed},
deaths: ${deaths},
population: ${population},
graphConfirmed: ${graphConfirmed},
graphDeaths: ${graphDeaths}
    ''';
  }
}
