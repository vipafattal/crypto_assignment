import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/material.dart';

import '../colours.dart';

class MaterialTag extends StatelessWidget {
  final String name;
  final bool highlighted;

  const MaterialTag({
    Key? key,
    required this.name,
    this.highlighted: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Resources.textStyles.textSecondary2;
    return Card(
      color: highlighted ? Colors.blueGrey : Colours.colorItemSecondary,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          name[0].toUpperCase() + name.substring(1),
          style: textStyle.copyWith(
              color: highlighted ? Colors.white : Colours.colorTextSecondary),
        ),
      ),
    );
  }
}
