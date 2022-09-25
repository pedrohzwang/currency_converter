import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:currency_converter/widgets/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyForm extends StatelessWidget {
  CurrencyForm({super.key});

  final TextEditingController realController = TextEditingController();
  final TextEditingController dollarController = TextEditingController();
  final TextEditingController euroController = TextEditingController();
  final TextEditingController sterlingController = TextEditingController();
  final TextEditingController canadianDollarController =
      TextEditingController();
  final TextEditingController australianDollarController =
      TextEditingController();
  final TextEditingController bitcoinController = TextEditingController();

  late double dolar;
  late double euro;
  late double sterling;
  late double canadianDollar;
  late double australianDollar;
  late double bitcoin;

  void _realChanged() {
    if (realController.text == '') {
      realController.clear();
      dollarController.clear();
      euroController.clear();
      sterlingController.clear();
      canadianDollarController.clear();
      australianDollarController.clear();
      bitcoinController.clear();
    } else {
      try {
        double real = double.parse(realController.text);
        dollarController.text = (real / dolar).toStringAsFixed(2);
        euroController.text = (real / euro).toStringAsFixed(2);
        sterlingController.text = (real / sterling).toStringAsFixed(2);
        canadianDollarController.text =
            (real / canadianDollar).toStringAsFixed(2);
        australianDollarController.text =
            (real / australianDollar).toStringAsFixed(2);
        bitcoinController.text = (real / bitcoin).toStringAsFixed(2);
      } catch (e, stacktrace) {
        print(stacktrace);
      }
    }
  }

  Map<String, dynamic> filterResults(String results) {
    Map<String, dynamic> filtered =
        json.decode(results)['results']['currencies'];
    filtered.removeWhere((key, value) =>
        key == 'ARS' || key == 'CNY' || key == 'JPY' || key == 'source');

    return filtered;
  }

  List<Currency> getFilteredCurrencies(String results) {
    Map<String, dynamic> data = filterResults(results);
    List<String> symbols = data.keys.toList();
    List<Currency> filtered =
        data.values.map((e) => Currency.fromJson(e)).toList();
    for (var i = 0; i < filtered.length; i++) {
      filtered[i].symbol = symbols[i];
    }
    dolar = filtered[0].buy;
    euro = filtered[1].buy;
    sterling = filtered[2].buy;
    canadianDollar = filtered[3].buy;
    australianDollar = filtered[4].buy;
    bitcoin = filtered[5].buy;

    return filtered;
  }

  Widget getTextField(
      String label, String symbol, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixText: symbol,
        ),
      ),
    );
  }

  Widget buildForm(context, snapshot) {
    String body = snapshot.data!.bodyString;
    final List<Currency> currencies = getFilteredCurrencies(body);
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: TextField(
              controller: realController,
              decoration: const InputDecoration(
                labelText: 'Real',
                prefixText: 'R\$',
              ),
              onChanged: (value) => _realChanged(),
            ),
          ),
          getTextField(
              currencies[0].name, currencies[0].symbol!, dollarController),
          getTextField(
              currencies[1].name, currencies[1].symbol!, euroController),
          getTextField(
              currencies[2].name, currencies[2].symbol!, sterlingController),
          getTextField(currencies[3].name, currencies[3].symbol!,
              canadianDollarController),
          getTextField(currencies[4].name, currencies[4].symbol!,
              australianDollarController),
          getTextField(
              currencies[5].name, currencies[5].symbol!, bitcoinController),
        ],
      ),
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
