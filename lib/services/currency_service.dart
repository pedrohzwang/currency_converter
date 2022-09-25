import 'package:chopper/chopper.dart';

part 'currency_service.chopper.dart';

@ChopperApi(baseUrl: '/finance')
abstract class CurrencyService extends ChopperService {
  @Get()
  Future<Response> getCurrencies(
      {@Query() String apiKey, @Query() String format});

  static CurrencyService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.hgbrasil.com',
      services: [
        _$CurrencyService(),
      ],
      converter: const JsonConverter(),
    );

    return _$CurrencyService(client);
  }
}
