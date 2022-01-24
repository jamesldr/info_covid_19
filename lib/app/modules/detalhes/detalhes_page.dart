import 'package:auto_size_text/auto_size_text.dart';
import 'package:estatisticas_covid/shared/app_assets/app_images.dart';
import 'package:estatisticas_covid/shared/widgets/detalhes/status_grafico.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../shared/constants/app_colors.dart';
import '../../data/models/estado_model.dart';
import 'controller/detalhes_controller.dart';

class DetalhesPage extends StatefulWidget {
  final EstadoModel model;
  const DetalhesPage({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  DetalhesPageState createState() => DetalhesPageState();
}

class DetalhesPageState extends State<DetalhesPage> {
  final DetalhesController store = Modular.get();

  @override
  void initState() {
    Future.microtask(
      () async => await store.populate(sigla: widget.model.sigla ?? ''),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Row(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AppImages.icon,
              ),
            ),
            const Text('INFO COVID-19'),
          ],
        ),
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildBandeira(context),
                _buildDataAtualizacao(context),
                _buildStatus(context),
                _buildGraficos(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBandeira(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: widget.model.bandeira,
        ),
        Positioned.fill(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AutoSizeText(
                widget.model.nome ?? '',
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(offset: Offset(1, 1)),
                    Shadow(offset: Offset(-1, -1)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataAtualizacao(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Text(
            'Última atualizaçao: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Observer(
            builder: (_) {
              return Text(
                store.date ?? '',
                style: const TextStyle(),
              );
            },
          ),
        ],
      ),
    );
  }

  _buildStatus(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Status',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Populaçao Estimada: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          return Text(
                            (store.population ?? ''),
                            style: const TextStyle(),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Casos Confirmados: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          return Text(
                            store.confirmed ?? '',
                            style: const TextStyle(),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Mortes: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Observer(
                        builder: (_) {
                          return Text(
                            store.deaths ?? '',
                            style: const TextStyle(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildGraficos(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Gráfico (últimos 30 dias)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Observer(builder: (_) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: constraints.maxWidth / 1.5,
                                    child: StatusGrafico(
                                      confirmados: store.graphConfirmed ?? [],
                                      mortes: store.graphDeaths ?? [],
                                    ),
                                  ),
                                  SizedBox(
                                    height: constraints.maxWidth / 1.5,
                                    child: StatusGrafico(
                                      confirmados: const [],
                                      mortes: store.graphDeaths ?? [],
                                    ),
                                  ),
                                ],
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
