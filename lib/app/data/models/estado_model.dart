import 'package:estatisticas_covid/shared/app_assets/bandeira_estados.dart';
import 'package:flutter/material.dart';

class EstadoModel {
  String? sigla;
  String? nome;

  EstadoModel({this.sigla, this.nome});

  EstadoModel.fromJson(Map<String, dynamic> json) {
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['sigla'] = sigla;
    data['nome'] = nome;

    return data;
  }

  Widget get bandeira {
    switch (sigla) {
      case 'AC':
        return BandeiraEstados.ac;
      case 'AL':
        return BandeiraEstados.al;
      case 'AP':
        return BandeiraEstados.ap;
      case 'AM':
        return BandeiraEstados.am;
      case 'BA':
        return BandeiraEstados.ba;
      case 'CE':
        return BandeiraEstados.ce;
      case 'DF':
        return BandeiraEstados.df;
      case 'ES':
        return BandeiraEstados.es;
      case 'GO':
        return BandeiraEstados.go;
      case 'MA':
        return BandeiraEstados.ma;
      case 'MT':
        return BandeiraEstados.mt;
      case 'MS':
        return BandeiraEstados.ms;
      case 'MG':
        return BandeiraEstados.mg;
      case 'PA':
        return BandeiraEstados.pa;
      case 'PB':
        return BandeiraEstados.pb;
      case 'PR':
        return BandeiraEstados.pr;
      case 'PE':
        return BandeiraEstados.pe;
      case 'PI':
        return BandeiraEstados.pi;
      case 'RJ':
        return BandeiraEstados.rj;
      case 'RN':
        return BandeiraEstados.rn;
      case 'RS':
        return BandeiraEstados.rs;
      case 'RO':
        return BandeiraEstados.ro;
      case 'RR':
        return BandeiraEstados.rr;
      case 'SC':
        return BandeiraEstados.sc;
      case 'SP':
        return BandeiraEstados.sp;
      case 'SE':
        return BandeiraEstados.se;
      case 'TO':
        return BandeiraEstados.to;
      default:
        return Container();
    }
  }
}
