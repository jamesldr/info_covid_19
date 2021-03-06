import 'package:auto_size_text/auto_size_text.dart';
import 'package:estatisticas_covid/shared/widgets/detalhes/status_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:estatisticas_covid/shared/app_assets/app_images.dart';
import 'package:estatisticas_covid/shared/widgets/detalhes/status_grafico.dart';

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
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppImages.icon,
              ),
            ),
            const Text('INFO COVID-19'),
          ],
        ),
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          return store.state == DetalhesState.done
              ? Scrollbar(
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
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
        }),
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
            '??ltima atualiza??ao: ',
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
                'Status (total)',
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
                  _buildPopulationRow(),
                  const SizedBox(height: 8),
                  _buildConfirmedRow(),
                  const SizedBox(height: 8),
                  _buildDeathsRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeathsRow() {
    return Observer(builder: (_) {
      return StatusRow(label: 'Mortes', value: store.deaths);
    });
  }

  Widget _buildConfirmedRow() {
    return Observer(builder: (_) {
      return StatusRow(label: 'Casos Confirmados', value: store.confirmed);
    });
  }

  Widget _buildPopulationRow() {
    return Observer(builder: (_) {
      return StatusRow(label: 'Popula??ao Estimada', value: store.population);
    });
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
                'Gr??fico (??ltimos 30 dias)',
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
