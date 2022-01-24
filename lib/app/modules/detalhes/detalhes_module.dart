import 'package:flutter_modular/flutter_modular.dart';

import 'controller/detalhes_controller.dart';
import 'detalhes_page.dart';

class DetalhesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetalhesController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DetalhesPage(model: args.data)),
  ];
}
