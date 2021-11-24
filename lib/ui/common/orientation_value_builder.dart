import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

T getValueForOrientation<T>(
  context, {
  required T portrait,
  required T landscape,
}) {
  final orientation = MediaQuery.of(context).orientation;
  return orientation == Orientation.portrait ? portrait : landscape;
}
