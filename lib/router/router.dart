import 'package:task_manager/pages/login.dart';
import 'package:task_manager/pages/home_page.dart';

final routes = {
  '/login': (context) => const LoginPage(),
  '/start': (context) => const HomePage()
};

const _mainUrl = '/entek/api/ed/';
final urls = {
  'login': '${_mainUrl}login',
  'logout': '${_mainUrl}logout',
  'ping': '${_mainUrl}logout',
};