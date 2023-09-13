import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade200,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.blue.shade400,
      titleTextStyle: const TextStyle(
          color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
  useMaterial3: true,
);
