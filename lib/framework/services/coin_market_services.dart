import 'package:crypto_assignment/framework/utils/bass_networking.dart';
import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/models/network_process.dart';
import 'package:crypto_assignment/models/price_conversion.dart';

class CoinMarketServices {
  CoinMarketServices._internal();

  static CoinMarketServices? _instance;

  static CoinMarketServices get instance {
    return _instance ??= CoinMarketServices._internal();
  }

  Future<NetworkProcess<PriceConversion>> conversionWith({
    required double amount,
    required int currencyId,
  }) async {
    return await Networking.getRequest(
      endpoint: _EndPoints.priceConversion
          .applyParameter()
          .withAmount(amount)
          .and()
          .withId(currencyId),
      transform: (rawData) => PriceConversion.fromMap(rawData),
    );
  }

  Future<NetworkProcess<List<CryptoCurrency>>> getCryptoCurrencies() async {
    return await Networking.getRequest(
      endpoint: _EndPoints.cryptoCurrencyListingsLatest,
      transform: (rawData) => (rawData as List<dynamic>)
          .map((e) => CryptoCurrency.fromMap(e))
          .toList(growable: false),
    );
  }

  Future<NetworkProcess<List<CryptoCurrencyInfo>>> getCryptoCurrenciesInfo(
    List<int> ids,
  ) async {
    return await Networking.getRequest(
        endpoint: _EndPoints.cryptoCurrencyInfo.applyParameter().withIds(ids),
        transform: (rawData) => (rawData as Map<String, dynamic>)
            .values
            .map((value) => CryptoCurrencyInfo.fromMap(value))
            .toList(growable: false));
  }
}

class _EndPoints {
  static const priceConversion = _tools + "/" + "price-conversion";
  static const cryptoCurrencyQuotes = _cryptoCurrency + "/" + _quotes;
  static const cryptoCurrencyInfo = _cryptoCurrency + "/" + _info;
  static const cryptoCurrencyListings = _cryptoCurrency + "/" + _listings;
  static const cryptoCurrencyListingsLatest =
      cryptoCurrencyListings + "/" + _latest;

  static const _cryptoCurrency = "cryptocurrency";
  static const _tools = "tools";

  static const _quotes = "quotes";
  static const _info = "info";
  static const _listings = "listings";
  static const _latest = "latest";
}

extension _Parameters on String {
  String applyParameter() => "$this?";

  String and() => "$this&";

  String withSymbols(List<String> values) =>
      this + 'symbol=' + values.join(',');

  String withIds(List<int> values) => this + 'id=' + values.join(',');

  String withId(int value) => this + 'id=' + value.toString();

  String withAmount(double value) => this + 'amount=' + value.toString();
}
