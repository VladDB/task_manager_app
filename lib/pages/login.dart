import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/model/user_session.dart';

import '../services/auth_server.dart';

class LoginPage extends StatefulWidget {
  static var isLogin = false;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _sizeText = const TextStyle(fontSize: 20.0, color: Colors.black);
  final _host = TextEditingController();
  bool _hostValid = false;
  final _port = TextEditingController();
  bool _portValid = false;
  final _login = TextEditingController();
  bool _logValid = false;
  final _pass = TextEditingController();
  bool _passValid = false;
  var _useHttps = false;
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (box.remove('session') != null) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 75,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _host,
                decoration: InputDecoration(
                  labelText: 'host',
                  errorText: _hostValid ? 'Host Can\'t Be Empty' : null,
                ),
                keyboardType: TextInputType.url,
                style: _sizeText,
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _port,
                decoration: InputDecoration(
                  labelText: 'port',
                  errorText: _portValid ? 'Port can\'t be empty' : null,
                ),
                keyboardType: TextInputType.number,
                style: _sizeText,
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _login,
                decoration: InputDecoration(
                  labelText: 'login',
                  errorText: _logValid ? 'Login Can\'t Be Empty' : null,
                ),
                keyboardType: TextInputType.name,
                style: _sizeText,
              ),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _pass,
                decoration: InputDecoration(
                  labelText: 'password',
                  errorText: _passValid ? 'Password Can\'t Be Empty' : null,
                ),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: _sizeText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 190,
                child: SwitchListTile(
                  title: Text('Use https:'),
                  value: _useHttps,
                  activeColor: Colors.blue,
                  onChanged: (bool value) {
                    setState(() {
                      _useHttps = value;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: MaterialButton(
                color: Colors.blue.shade500,
                height: 50,
                minWidth: 150,
                onPressed: () async {
                  setState(() {
                    _host.text.isEmpty ? _hostValid = true : _hostValid = false;
                    _port.text.isEmpty ? _portValid = true : _portValid = false;
                    _pass.text.isEmpty ? _passValid = true : _passValid = false;
                    _login.text.isEmpty ? _logValid = true : _logValid = false;
                  });
                  if (_hostValid || _portValid || _passValid || _logValid) {
                    return;
                  }
                  UserSession session = UserSession(
                      username: _login.text,
                      password: _pass.text,
                      host: _useHttps
                          ? 'https://${_host.text.trim()}'
                          : 'http://${_host.text.trim()}',
                      port: _port.text);
                  box.write('session', session);
                  var auth = Auth();
                  var result = await auth.doLogin();
                  if (context.mounted) {
                    await showDialog(
                      context: context,
                      builder: (_) =>
                          AlertDialog(
                              title: Text(
                                result.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              )),
                    );
                  }
                  if (context.mounted && LoginPage.isLogin) {
                    Navigator.pushReplacementNamed(context, '/start');
                  }
                },
                splashColor: Colors.blue.shade800,
                child: const Text(
                  'Войти',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
