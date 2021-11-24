import 'package:crypto_assignment/ui/common/resources/text_styles/text_styles.dart';
import 'package:crypto_assignment/ui/common/widgets/tags_list_view.dart';
import 'package:flutter/material.dart';

class TagsPage extends StatelessWidget {

  final String currencyName;
  final List<String> tags;

  const TagsPage({
    Key? key,
    required this.currencyName,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "$currencyName Tags",
            style: TextStyles.buildAppBar(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child: TagGenerator(tagList: tags)));
  }
}
