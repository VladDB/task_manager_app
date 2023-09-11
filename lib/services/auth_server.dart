import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager/pages/login.dart';
import 'package:task_manager/router/router.dart';

class Auth {
  var _server = '10.0.2.2';
  var _port = '8849';
  var _login;
  var _pass;
  var _token;

  Auth(this._login, this._pass, this._server, this._port);

  Future<int?> doLogin() async {
    var basic = 'Basic ${base64Encode(utf8.encode('$_login:$_pass'))}';
    var statusCode;
    try {
      final response = await Dio().get('http://$_server:$_port${urls['login']}',
          options: Options(
            headers: {'Authorization': basic},
          ));
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        _token = data['token'];
        if (_token != null) {
          LoginPage.isLogin = true;
          statusCode = response.statusCode;
        }
      }
    } on DioException catch (e) {
      LoginPage.isLogin = false;
      statusCode = e.response?.statusCode;
    }
    return statusCode;
  }
}
