import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/text_styles.dart';
import 'package:crypto_assignment/ui/common/widgets/material_divider.dart';
import 'package:crypto_assignment/utils/open_url.dart';
import 'package:flutter/material.dart';

class LinksPage extends StatelessWidget {
  final String currencyName;
  final Map<String, List<String>> linksList;

  const LinksPage(
      {Key? key, required this.currencyName, required this.linksList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "$currencyName links",
          style: TextStyles.buildAppBar(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: linksList.length,
        itemBuilder: (ctx, index) {
          final links = linksList.entries.toList(growable: false)[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                (links.key[0].toUpperCase() + links.key.substring(1)).replaceAll("_", ' '),
                  style: Resources.textStyles.textSecondary1,
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.only(),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: links.value.length,
                itemBuilder: (_, linkIndex) => InkWell(
                  onTap: () => openUrl(links.value[linkIndex]),
                  borderRadius: BorderRadius.circular(2.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          Text(
                            links.value[linkIndex]
                                .replaceAll(RegExp("(http|https)://"), ""),
                            style: Resources.textStyles.textBody7,
                          ),
                          Spacer(),
                          MaterialDivider()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
