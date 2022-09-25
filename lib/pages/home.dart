import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget buildForm(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(
        child: StyledText('Aguarde...'),
      );
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Icon(
                Icons.error,
                size: 70,
              ),
            ),
            StyledText('Oops... Algo deu errado.\n Tente novamente mais tarde.')
          ],
        ),
      );
    } else {
      final Map<String, dynamic> bruteData =
          json.decode(snapshot.data!.bodyString)['results']['currencies'];
      bruteData.remove('source');
      final List<Currency> currencies =
          bruteData.values.map((e) => Currency.fromJson(e)).toList();
      final List<String> labels = bruteData.keys.toList();
      return ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          Currency currency = currencies[index];
          return ListTile(
            title: Text(labels[index]),
            subtitle: Text(currency.buy.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: FutureBuilder<Response>(
        future: Provider.of<CurrencyService>(context).getCurrencies(),
        builder: (context, snapshot) => buildForm(context, snapshot),
      ),
    );
  }
}
