import 'package:currency_converter/pages/currency_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurrencyForm(),
          ],
        ),
      ),
    );
  }
}
