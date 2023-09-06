import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static var doLogin = false;

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _sizeText = const TextStyle(fontSize: 20.0, color: Colors.black);
  var _adress;
  var _port;
  var _name;
  var _pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'host'),
                keyboardType: TextInputType.url,
                style: _sizeText,
                onSaved: (val) {
                  _adress = val;
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
                onSaved: (val) {
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
                onSaved: (val) {
                  _name = val;
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
                onSaved: (val) {
                  _pass = val;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: MaterialButton(
                color: Colors.indigo.shade500,
                height: 50,
                minWidth: 150,
                onPressed: () {
                  Navigator.pushNamed(context, '/start');
                },
                splashColor: Colors.red,
                child: const Text(
                  'Войти',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
