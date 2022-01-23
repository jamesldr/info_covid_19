// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool>? _$isLoginAvaliableComputed;

  @override
  bool get isLoginAvaliable => (_$isLoginAvaliableComputed ??= Computed<bool>(
          () => super.isLoginAvaliable,
          name: '_LoginControllerBase.isLoginAvaliable'))
      .value;

  final _$isPasswordVisibleAtom =
      Atom(name: '_LoginControllerBase.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoginSuccessfulAtom =
      Atom(name: '_LoginControllerBase.isLoginSuccessful');

  @override
  bool get isLoginSuccessful {
    _$isLoginSuccessfulAtom.reportRead();
    return super.isLoginSuccessful;
  }

  @override
  set isLoginSuccessful(bool value) {
    _$isLoginSuccessfulAtom.reportWrite(value, super.isLoginSuccessful, () {
      super.isLoginSuccessful = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic togglePasswordVisibility([bool? value]) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic emailOnChanged(String? v) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.emailOnChanged');
    try {
      return super.emailOnChanged(v);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic passwordOnChanged(String? v) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.passwordOnChanged');
    try {
      return super.passwordOnChanged(v);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible},
email: ${email},
password: ${password},
isLoginSuccessful: ${isLoginSuccessful},
loading: ${loading},
isLoginAvaliable: ${isLoginAvaliable}
    ''';
  }
}
