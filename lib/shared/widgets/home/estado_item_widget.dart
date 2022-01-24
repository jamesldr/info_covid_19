import 'package:auto_size_text/auto_size_text.dart';
import 'package:estatisticas_covid/app/data/models/estado_model.dart';
import 'package:estatisticas_covid/shared/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EstadoItemWidget extends StatelessWidget {
  const EstadoItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final EstadoModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () => Modular.to.pushNamed(
          AppRoutes.detalhes,
          arguments: model,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(),
                  ),
                  width: 70,
                  child: model.bandeira,
                ),
                Expanded(
                  child: Row(
                    children: [
                      AutoSizeText(
                        model.sigla! + ' - ',
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        model.nome!,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
