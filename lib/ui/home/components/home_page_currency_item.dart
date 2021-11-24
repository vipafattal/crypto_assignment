import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/ui/common/colours.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:crypto_assignment/ui/common/widgets/logo_image.dart';
import 'package:crypto_assignment/ui/navigation_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePageCurrencyItem extends StatelessWidget {
  final CryptoCurrency currency;
  final int index;

  const HomePageCurrencyItem({
    Key? key,
    required this.currency,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quote = currency.quoteInUSD;
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => NavigationModel.opnDetailsPage(
        context,
        currency: currency,
        index: index,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Card(
                elevation: 0.0,
                color: Colours.colorItemSecondary,
                child: SizedBox(
                    width: 45,
                    height: 30,
                    child: Center(
                      child: Text(
                        "#${currency.rank}",
                        textAlign: TextAlign.center,
                        style: Resources.textStyles.textSecondary,
                      ),
                    )),
              ),
            ),
            Hero(
              tag: "logo$index",
              child: LogoImage(
                url: currency.largeImageUrl,
                size: 32,
              ),
            ),
            SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: "name$index",
                  child: Text(
                    "${currency.name}",
                    style: Resources.textStyles.textBody2,
                  ),
                ),
                Text(
                  "${currency.symbol}",
                  style: Resources.textStyles.textSecondary,
                ),
              ],
            ),
            Spacer(),
            Text(
              quote.getFormattedPrice(),
              style: Resources.textStyles.textBody5,
            ),
          ],
        ),
      ),
    );
  }
}
