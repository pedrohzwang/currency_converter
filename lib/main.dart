import 'package:currency_converter/pages/home.dart';
import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Home(),
    ),
  );
}
