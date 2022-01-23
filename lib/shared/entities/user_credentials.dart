class UserCredentials {
  String? _email;
  String? _password;

  String get email => _email ?? '';
  String get password => _password ?? '';

  set email(String v) => _email = v;
  set password(String v) => _password = v;
}
