import 'package:flutter/material.dart';

import '../services/auth_server.dart';

class LoginPage extends StatefulWidget {
  static var isLogin = false;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _sizeText = const TextStyle(fontSize: 20.0, color: Colors.black);
  var _host = '10.0.2.2';
  var _port;
  var _login;
  var _pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log in'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              size: 50,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'host'),
                keyboardType: TextInputType.url,
                style: _sizeText,
                onChanged: (val) {
                  _host = val;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'port'),
                keyboardType: TextInputType.number,
                style: _sizeText,
                onChanged: (val) {
                  _port = val;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'username'),
                keyboardType: TextInputType.name,
                style: _sizeText,
                onChanged: (val) {
                  _login = val;
                  setState(() {});
                },
              ),
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'password'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: _sizeText,
                onChanged: (val) {
                  _pass = val;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: MaterialButton(
                color: Colors.amber.shade500,
                height: 50,
                minWidth: 150,
                onPressed: () async {
                  var auth = Auth(_login, _pass, _host, _port);
                  await auth.doLogin();
                  if (context.mounted) {
                    await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          title: Text(
                        LoginPage.isLogin
                            ? 'Успешная авторизация'
                            : 'Проверьте логин/пароль\n и соединение с сервером',
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
                splashColor: Colors.amber.shade800,
                child: const Text(
                  'Войти',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
