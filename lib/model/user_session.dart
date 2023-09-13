class UserSession {
  String username;
  String password;
  String host;
  String port;
  String? token;
  DateTime? _timestamp;

  UserSession({
    required this.username,
    required this.password,
    required this.host,
    required this.port
});

  //String? get token => _token;
  // set token(String? token) {
  //   _token = token;
  //   _timestamp = DateTime(0);
  // }
}