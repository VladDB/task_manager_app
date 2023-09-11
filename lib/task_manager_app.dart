import 'package:flutter/material.dart';

import 'package:task_manager/pages/login.dart';
import 'package:task_manager/router/router.dart';
import 'package:task_manager/theme/theme.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: mainTheme,
      routes: routes,
      initialRoute: LoginPage.isLogin ? '/start' : '/login',
    );
  }
}