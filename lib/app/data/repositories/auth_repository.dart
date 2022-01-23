import 'dart:convert';

import 'package:estatisticas_covid/shared/entities/user_credentials.dart';
import 'package:flutter/services.dart';

class AuthRepository {
  Future<bool> tryLogin(UserCredentials credentials) async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/login.json');
      final Map<String, dynamic> data = jsonDecode(response);
      if (data['email'] == credentials.email) {
        if (data['senha'] == credentials.password) {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
