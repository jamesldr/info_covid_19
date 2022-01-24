import 'package:estatisticas_covid/app/data/repositories/auth_repository.dart';
import 'package:estatisticas_covid/shared/constants/app_routes.dart';
import 'package:estatisticas_covid/shared/entities/user_credentials.dart';
import 'package:estatisticas_covid/shared/utils/debug_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final logger = DebugLogger();
  @observable
  bool isPasswordVisible = false;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isLoginSuccessful = false;

  @observable
  bool loading = false;

  @computed
  bool get isLoginAvaliable =>
      (email != null && email!.isNotEmpty) &&
      (password != null && password!.isNotEmpty);

  @action
  togglePasswordVisibility([bool? value]) =>
      isPasswordVisible = value ?? !isPasswordVisible;

  @action
  emailOnChanged(String? v) => email = v;

  @action
  passwordOnChanged(String? v) => password = v;

  @action
  login(BuildContext context) async {
    if (loading) {
      return;
    }
    loading = true;
    await Future.delayed(const Duration(seconds: 1));
    final AuthRepository repo = Modular.get();
    var credentials = UserCredentials();
    credentials.email = email ?? '';
    credentials.password = password ?? '';
    isLoginSuccessful = await repo.tryLogin(credentials);
    loading = false;
    if (isLoginSuccessful) {
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } else {
      logger('Login falhou');
      const _snackbar = SnackBar(
        content: Text(
          'Login Falhou: e-mail e/ou senha incorretos',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackbar);
    }
  }
}
