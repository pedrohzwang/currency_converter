// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CurrencyService extends CurrencyService {
  _$CurrencyService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  static const apiKey = '9c5d7064';
  static const format = 'json';

  @override
  final definitionType = CurrencyService;

  @override
  Future<Response<dynamic>> getCurrencies({
    String apiKey = apiKey,
    String format = format,
  }) {
    final $url = '/finance';
    final $params = <String, dynamic>{
      'apiKey': apiKey,
      'format': format,
    };
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );

    return client.send<dynamic, dynamic>($request);
  }
}
