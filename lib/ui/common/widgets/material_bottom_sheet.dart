import 'package:flutter/material.dart';

class MaterialBottomSheet extends StatelessWidget {
  final Widget child;

  const MaterialBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: child,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            spreadRadius: 6,
            offset: Offset(0.0, -1.0),
            blurRadius: 24.0,
          )
        ]));
  }
}
