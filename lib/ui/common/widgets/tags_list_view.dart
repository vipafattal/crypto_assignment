library fluttertagselector;

import 'package:crypto_assignment/ui/common/colours.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class TagGenerator extends StatefulWidget {
  final List<String> tagList;

  final double fontSize;

  TagGenerator({
    required this.tagList,
    this.fontSize = 15,
  });

  @override
  _TagGeneratorState createState() => _TagGeneratorState();
}

class _TagGeneratorState extends State<TagGenerator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Wrap(
        children: widget.tagList.map((e) => _buildTag(e)).toList(),
      ),
    );
  }

  Container _buildTag(String data) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0, bottom: 15.0),
      decoration: BoxDecoration(
        color: Colours.colorItemSecondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
            child: Text(
              data,
              style: TextStyles.buildCustom(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: widget.fontSize),
            ),
          ),
        ],
      ),
    );
  }

}
