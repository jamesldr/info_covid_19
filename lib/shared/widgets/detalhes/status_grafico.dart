/// Example of a stacked area chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:estatisticas_covid/shared/entities/graph_model.dart';
import 'package:flutter/material.dart';

class StatusGrafico extends StatelessWidget {
  const StatusGrafico({
    Key? key,
    required this.confirmados,
    required this.mortes,
  }) : super(key: key);
  final List<GraphModel> confirmados;
  final List<GraphModel> mortes;

  @override
  Widget build(BuildContext context) {
    newConfirmados() {
      int? minVal;
      for (var i = 0; i < confirmados.length; i++) {
        if (minVal == null || minVal > confirmados[i].value) {
          minVal = confirmados[i].value;
        }
      }
      return List.generate(
        confirmados.isNotEmpty ? confirmados.length - 1 : confirmados.length,
        (i) => GraphModel(
          date: confirmados[i].date,
          value: confirmados[i].value - (minVal ?? 0),
        ),
      );
    }

    newMortes() {
      int? minVal;
      for (var i = 0; i < mortes.length; i++) {
        if (minVal == null || minVal > mortes[i].value) {
          minVal = mortes[i].value;
        }
      }
      return List.generate(
        mortes.isNotEmpty ? mortes.length - 1 : mortes.length,
        (i) => GraphModel(
          date: mortes[i].date,
          value: mortes[i].value - (minVal ?? 0),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: charts.LineChart(
            [
              charts.Series<GraphModel, int>(
                id: 'Confirmados',
                colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
                domainFn: (GraphModel model, _) => model.day,
                measureFn: (GraphModel model, _) => model.value,
                data: newConfirmados(),
              ),
              charts.Series<GraphModel, int>(
                id: 'Mortes',
                colorFn: (_, __) =>
                    charts.MaterialPalette.deepOrange.shadeDefault,
                domainFn: (GraphModel model, _) => model.day,
                measureFn: (GraphModel model, _) => model.value,
                data: newMortes(),
              ),
            ],
            defaultRenderer:
                charts.LineRendererConfig(includeArea: true, stacked: false),
            animate: false,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: confirmados.isNotEmpty,
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    ' Confirmados',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Visibility(
              visible: mortes.isNotEmpty,
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text(
                    ' Mortes',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
