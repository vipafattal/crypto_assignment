import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String name;
  final Widget widget;
  final Function() onTap;

  const RowItem({
    Key? key,
    required this.name,
    required this.widget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Resources.textStyles.textBody7,
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
