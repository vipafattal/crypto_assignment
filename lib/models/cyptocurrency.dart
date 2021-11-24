import 'package:crypto_assignment/framework/consts.dart';
import 'package:crypto_assignment/utils/formatter.dart';
import 'package:crypto_assignment/utils/map.dart';

class CryptoCurrency {
  final int id;
  final int rank;
  final String name;
  final double? maxSupply;
  final double totalSupply;
  final double circulatingSupply;
  final String symbol;
  final String slug;
  final Map<String, Quote> quote;
  final DateTime lastUpdated;

  String get minImageUrl => IMAGE_URL + "16x16/$id.png";

  String get largeImageUrl => IMAGE_URL + "32x32/$id.png";

  String get xLargeImageUrl => IMAGE_URL + "64x64/$id.png";

  CryptoCurrency({
    required this.id,
    required this.rank,
    required this.maxSupply,
    required this.totalSupply,
    required this.circulatingSupply,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.quote,
    required this.lastUpdated,
  });

  CryptoCurrency.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        rank = data['cmc_rank'],
        maxSupply = data['max_supply']?.toDouble(),
        circulatingSupply = data['circulating_supply'].toDouble(),
        totalSupply = data['total_supply'].toDouble(),
        name = data['name'],
        slug = data['slug'],
        symbol = data['symbol'],
        lastUpdated = DateTime.parse(data['last_updated']),
        quote = (data['quote'] as Map<String, dynamic>)
            .transformValues((key, value) => Quote.fromMap(value));

  Quote get quoteInUSD => quote['USD']!;
}

class Quote {
  final double price;
  final double volume24hour;
  final double volumeChange24hour;
  final double percentChange7day;
  final double percentChange30day;
  final double percentChange60day;
  final double percentChange90day;
  final double marketCap;
  final double marketCapDominance;

  Quote({
    required this.price,
    required this.volume24hour,
    required this.volumeChange24hour,
    required this.percentChange7day,
    required this.percentChange30day,
    required this.percentChange60day,
    required this.percentChange90day,
    required this.marketCap,
    required this.marketCapDominance,
  });

  String getFormattedPrice() => moneyFormatter.format(price);

  Quote.fromMap(Map<String, dynamic> data)
      : price = data['price'],
        volume24hour = data['volume_24h'].toDouble(),
        volumeChange24hour = data['volume_change_24h'].toDouble(),
        percentChange7day = data['percent_change_7d'].toDouble(),
        percentChange30day = data['percent_change_30d'].toDouble(),
        percentChange60day = data['percent_change_60d'].toDouble(),
        percentChange90day = data['percent_change_90d'].toDouble(),
        marketCap = data['market_cap'].toDouble(),
        marketCapDominance = data['market_cap_dominance'].toDouble();
}

class CryptoCurrencyInfo {
  final int id;
  final String category;
  final String description;
  final Map<String, List<String>> links;
  final List<String> tageNames;

  CryptoCurrencyInfo({
    required this.id,
    required this.category,
    required this.description,
    required this.links,
    required this.tageNames,
  });

  CryptoCurrencyInfo.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        description = data['description'],
        category = data['category'],
        tageNames = (data['tag-names'] as List<dynamic>).cast(),
        links = (data['urls'] as Map<String, dynamic>)
            .transformValues((key, data) => (data as List<dynamic>).cast())
              ..removeWhere((key, value) => value.isEmpty);
}

class CryptoCurrencyWithInfo {
  final CryptoCurrency currency;
  final CryptoCurrencyInfo info;

  CryptoCurrencyWithInfo({
    required this.currency,
    required this.info,
  });
}
