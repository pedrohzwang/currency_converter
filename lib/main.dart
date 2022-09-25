import 'package:currency_converter/pages/home.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CurrencyService.create(),
      dispose: (_, CurrencyService service) => service.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const Home(),
      ),
    );
  }
}
