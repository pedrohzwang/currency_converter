import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyForm extends StatelessWidget {
  const CurrencyForm({super.key});

  Map<String, dynamic> filterResults(String results) {
    Map<String, dynamic> filtered =
        json.decode(results)['results']['currencies'];
    filtered.remove('source');
    return filtered;
  }

  List<Currency> getFilteredCurrencies(String results) {
    return filterResults(results)
        .values
        .map((e) => Currency.fromJson(e))
        .toList();
  }

  List<String> getLabels(String results) {
    return filterResults(results).keys.toList();
  }

  Widget buildForm(context, snapshot) {
    String body = snapshot.data!.bodyString;
    final List<Currency> currencies = getFilteredCurrencies(body);
    final List<String> labels = getLabels(body);
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        Currency currency = currencies[index];
        currency.symbol = labels[index];
        return ListTile(
          title: Text(currency.symbol!),
          subtitle: Text(currency.buy.toString()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<CurrencyService>(context).getCurrencies(),
      builder: (context, snapshot) {
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
                StyledText(
                    'Oops... Algo deu errado.\n Tente novamente mais tarde.')
              ],
            ),
          );
        } else {
          return buildForm(context, snapshot);
        }
      },
    );
  }
}
