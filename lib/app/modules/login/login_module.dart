import 'package:estatisticas_covid/app/modules/login/login_Page.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'controller/login_controller.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
