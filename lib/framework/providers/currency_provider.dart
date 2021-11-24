import 'package:crypto_assignment/framework/services/coin_market_services.dart';
import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/models/network_process.dart';

class CurrencyData {
  final CoinMarketServices _apiService = CoinMarketServices.instance;

  Future<NetworkProcess<List<CryptoCurrency>>> getCurrencies() async {
    return await _apiService.getCryptoCurrencies();
  }

  Future<NetworkProcess<List<CryptoCurrencyInfo>>> getCurrencyInfo(
          int id) async =>
      await getCurrenciesInfo([id]);

  Future<NetworkProcess<List<CryptoCurrencyInfo>>> getCurrenciesInfo(
          List<int> ids) async =>
      await _apiService.getCryptoCurrenciesInfo(ids);
}
