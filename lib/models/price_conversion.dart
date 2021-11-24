import 'package:crypto_assignment/utils/map.dart';

class PriceConversion {
  final int id;
  final String symbol;
  final String name;
  final int amount;
  final DateTime lastUpdate;
  final Map<String, Quote> quote;

  PriceConversion({
    required this.id,
    required this.symbol,
    required this.name,
    required this.amount,
    required this.lastUpdate,
    required this.quote,
  });

  PriceConversion.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        symbol = data['symbol'],
        name = data['name'],
        amount = data['amount'],
        lastUpdate = DateTime.parse(data['last_updated']),
        quote = (data['quote'] as Map<String, dynamic>)
            .transformValues((key, data) => Quote.fromMap(data));
}

class Quote {
  final double price;

  Quote({
    required this.price,
  });

  Quote.fromMap(Map<String, dynamic> data) : price = data['price'];
}
