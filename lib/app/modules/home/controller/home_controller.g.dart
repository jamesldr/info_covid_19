// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$stateAtom = Atom(name: '_HomeControllerBase.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$estadosAtom = Atom(name: '_HomeControllerBase.estados');

  @override
  ObservableList<EstadoModel>? get estados {
    _$estadosAtom.reportRead();
    return super.estados;
  }

  @override
  set estados(ObservableList<EstadoModel>? value) {
    _$estadosAtom.reportWrite(value, super.estados, () {
      super.estados = value;
    });
  }

  final _$populateAsyncAction = AsyncAction('_HomeControllerBase.populate');

  @override
  Future populate() {
    return _$populateAsyncAction.run(() => super.populate());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic _setState(HomeState s) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase._setState');
    try {
      return super._setState(s);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
estados: ${estados}
    ''';
  }
}
