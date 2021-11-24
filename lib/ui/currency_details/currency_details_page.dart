import 'dart:math';

import 'package:crypto_assignment/framework/providers/currency_provider.dart';
import 'package:crypto_assignment/models/cyptocurrency.dart';
import 'package:crypto_assignment/ui/common/colours.dart';
import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/text_styles.dart';
import 'package:crypto_assignment/ui/common/widgets/logo_image.dart';
import 'package:crypto_assignment/ui/common/widgets/material_divider.dart';
import 'package:crypto_assignment/ui/common/widgets/material_tag.dart';
import 'package:crypto_assignment/ui/common/widgets/network_process_widget.dart';
import 'package:crypto_assignment/ui/common/widgets/price_converter.dart';
import 'package:crypto_assignment/ui/common/widgets/row_item.dart';
import 'package:crypto_assignment/ui/common/widgets/tag_view.dart';
import 'package:crypto_assignment/ui/navigation_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyDetailsPage extends StatelessWidget {
  final CryptoCurrency currency;
  final CurrencyData currencyData = CurrencyData();
  final int index;

  CurrencyDetailsPage({
    Key? key,
    required this.currency,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 8,
        title: Row(
          children: [
            Hero(
              tag: "logo$index",
              child: LogoImage(
                url: currency.largeImageUrl,
                size: 32,
              ),
            ),
            SizedBox(width: 8),
            Hero(
              tag: "name$index",
              child: Text(
                currency.name,
                style: TextStyles.buildAppBar(),
              ),
            ),
          ],
        ),
      ),
      body: FutureProcessBuilder<List<CryptoCurrencyInfo>>(
          futureProcess: currencyData.getCurrencyInfo(currency.id),
          widgetBuilder: (currencyInfoList) =>
              buildUI(context, currencyInfoList[0])),
    );
  }

  ListView buildUI(context, CryptoCurrencyInfo currencyInfo) {

    final lastUpdateInMin =
        DateTime.now().difference(currency.lastUpdated).inMinutes;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        buildPrice(),
        Row(
          children: [
            MaterialTag(
              name: "Rank #${currency.rank}",
              highlighted: true,
            ),
            MaterialTag(
              name: currencyInfo.category,
            ),
            MaterialTag(
              name: "Last Updated on: $lastUpdateInMin ago",
            ),
          ],
        ),
        SizedBox(height: 12),
        buildLinks(context, currencyInfo),
        MaterialDivider(),
        buildTags(context, currencyInfo),
        MaterialDivider(),
        SizedBox(height: 16),
        CurrencyConverter(currency: currency),
        buildDescription(currencyInfo),
        SizedBox(height: 24),
      ],
    );
  }

  Padding buildDescription(CryptoCurrencyInfo currencyInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Text('Description', style: Resources.textStyles.textBody1),
          SizedBox(height: 6),
          Text(
            currencyInfo.description,
            style: Resources.textStyles.textSecondary1
                .copyWith(color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget buildLinks(context, CryptoCurrencyInfo currencyInfo) {
    return Container(
      height: 60,
      child: RowItem(
        onTap: () => NavigationModel.opnLinksPage(context,
            currencyName: currency.name, linksList: currencyInfo.links),
        name: "Links",
        widget: Row(
          children: [
            Text(
              currencyInfo.links.keys.take(3).join(', ') + " etc.",
              overflow: TextOverflow.ellipsis,
              style: Resources.textStyles.textSecondary2,
              softWrap: true,
            ),
            buildMoreIcon()
          ],
        ),
      ),
    );
  }

  Icon buildMoreIcon() => Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colours.colorTextSecondary,
        size: 16,
      );

  Widget buildTags(context, CryptoCurrencyInfo currencyInfo) {
    final tags = currencyInfo.tageNames;

    return Container(
      height: 60,
      child: RowItem(
        onTap: () => NavigationModel.opnTagsPage(context,
            currencyName: currency.name, tagsList: tags),
        name: "Tags",
        widget: Row(
          children: [
            Row(
              children: [
                TagView(
                  tag: tags[0],
                ),
                if (tags.length > 1)
                  TagView(
                    tag: tags[1],
                  ),
                if (tags.length > 2) TagView(tag: "${min(15, tags.length)}+"),
                buildMoreIcon()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrice() {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Text('${currency.name} Price (${currency.symbol})',
              style: Resources.textStyles.textSecondary2),
          Text(
            currency.quoteInUSD.getFormattedPrice(),
            style: Resources.textStyles.textHeadings1,
          )
        ],
      ),
    );
  }
}
