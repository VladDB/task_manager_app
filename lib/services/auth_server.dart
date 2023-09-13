import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import 'package:task_manager/pages/login.dart';
import 'package:task_manager/router/router.dart';

import '../model/user_session.dart';

class Auth {
  UserSession? _session;
  var _token;
  final box = GetStorage();

  Future<String?> doLogin() async {
    _session = box.read('session');
    if (_session == null)
      return 'Нет данных для входа';
    var basic = 'Basic ${base64Encode(utf8.encode('${_session?.username}:${_session?.password}'))}';
    var status;
    try {
      final response = await Dio().get('${_session?.host}:${_session?.port}${urls['login']}',
          options: Options(
            headers: {'Authorization': basic},
          ));
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        _token = data['token'];
        if (_token != null) {
          LoginPage.isLogin = true;
          status = 'Успешная авторизация';
          _session?.token = _token;
          box.write('session', _session);
        } else {
          status = 'Неправильный логин/пароль';
        }
      }
    } on DioException catch (e) {
      LoginPage.isLogin = false;
      status = 'Ошибка авторизации. Проверьте соединение с сервером';
    }
    return status;
  }
}
