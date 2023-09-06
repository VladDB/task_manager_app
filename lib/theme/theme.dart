import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade300,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme: AppBarTheme(
      color: Colors.indigo.shade500,
      titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold)),
  useMaterial3: true,
);