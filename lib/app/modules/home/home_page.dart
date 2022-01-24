import 'package:estatisticas_covid/shared/app_assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:estatisticas_covid/shared/constants/app_colors.dart';
import 'package:estatisticas_covid/shared/widgets/home/estado_item_widget.dart';

import 'controller/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AppImages.icon,
        ),
        title: const Text('INFO COVID-19'),
        backgroundColor: AppColors.primary,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: controller.estados?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, i) {
                      return EstadoItemWidget(
                        model: controller.estados![i],
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
