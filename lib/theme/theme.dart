import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.purple,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    labelStyle: TextStyle(
      
      color: Colors.white,
    ),
  ),
);
