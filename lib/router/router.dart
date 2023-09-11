import 'package:task_manager/pages/login.dart';
import 'package:task_manager/pages/home_page.dart';

import '../components/hidden_drawer.dart';

final routes = {
  '/login': (context) => const LoginPage(),
  '/start': (context) => const HiddenDrawer()
};

const _mainUrl = '/entek/api/ed/';
final urls = {
  'login': '${_mainUrl}login',
  'logout': '${_mainUrl}logout',
  'ping': '${_mainUrl}logout',
};