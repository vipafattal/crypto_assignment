import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/material.dart';

import '../colours.dart';

class TagView extends StatelessWidget {
  final String tag;
  const TagView({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.0,
      color: Colours.colorItemSecondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                tag,
                textAlign: TextAlign.center,
                style: Resources.textStyles.textSecondary2,
              ),
            )),
      ),
    );
  }
}


