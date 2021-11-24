import 'package:flutter/material.dart';

import '../colours.dart';

class MaterialDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.8,
      width: double.maxFinite,
      color: Colours.colorItemSecondary,
    );
  }
}
