

import 'dart:convert';

import 'package:currency_converter/models/currency.dart';
import 'package:http/http.dart';


class CurrencyService {
  final Uri url = Uri.parse('https://api.hgbrasil.com/finance?format=json&key=9c5d7064');

  Future<List<Currency>> getValues() async {
    Response res = await get(url);
    List data = json.decode(res.body)['results']['currencies'];
    List<Currency> retorno = data.map((item) => Currency.fromJson(item)).toList();
    print(retorno);
    return retorno;
  }
}
