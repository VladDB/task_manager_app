import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade400,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber.shade500),
  appBarTheme: AppBarTheme(
      color: Colors.amber.shade500,
      titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 26,
          fontWeight: FontWeight.bold)),
  useMaterial3: true,
);