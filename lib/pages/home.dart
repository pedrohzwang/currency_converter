import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:currency_converter/models/currency.dart';
import 'package:currency_converter/services/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final CurrencyService service = CurrencyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Currency Converter'),
        ),
      ),
      body: FutureBuilder<List<Currency>>(
        future: service.getValues(),
        builder: (conext, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: Text('Loading...'),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Container(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Currency currency = snapshot.data![index];
                      return ListTile(
                        title: Text(currency.name),
                        subtitle: Text(currency.buy.toString()),
                      );
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
