import 'package:estatisticas_covid/app/modules/detalhes/detalhes_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:estatisticas_covid/shared/constants/app_routes.dart';

import 'data/repositories/auth_repository.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute(AppRoutes.home, module: HomeModule()),
    ModuleRoute(AppRoutes.detalhes, module: DetalhesModule()),
  ];
}
