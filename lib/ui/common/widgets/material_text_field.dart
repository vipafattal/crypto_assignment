import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colours.dart';

class MaterialTextField extends StatelessWidget {
  final int maxLines;
  final String? label;
  final VoidCallback? onPrefixIconPressed, onSuffixIconPressed;
  final Function(String)? onSubmit;
  final bool obscureText, autoFocus;
  final TextStyle? style;
  final IconData? suffixIcon, prefixIcon;
  final TextEditingController controller;
  final TextDirection textDirection;
  final TextInputType fieldType;
  final FocusScopeNode? node;
  final TextInputAction? inputAction;
  final Function? onFocusChange;
  final bool borderlessStyle;
  final bool isDense;

  MaterialTextField(
      {this.maxLines = 1,
      this.isDense = false,
      required this.controller,
      this.style,
      this.label,
      this.obscureText = false,
      this.node,
      this.onSuffixIconPressed,
      this.onPrefixIconPressed,
      this.onSubmit,
      this.textDirection = TextDirection.ltr,
      this.suffixIcon,
      this.fieldType = TextInputType.text,
      this.prefixIcon,
      this.onFocusChange,
      this.autoFocus = false,
      this.borderlessStyle = false,
      this.inputAction})
      : assert(
          prefixIcon == null && onPrefixIconPressed == null ||
              prefixIcon != null && onPrefixIconPressed != null,
        ),
        assert(
          suffixIcon == null && onSuffixIconPressed == null ||
              suffixIcon != null && onSuffixIconPressed != null,
        );

  @override
  Widget build(BuildContext context) {
    final focusColor = Colours.colorPrimary;

    final outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(9.0),
        borderSide: BorderSide(width: 2.5, color: focusColor));
    return TextField(
      style: style ?? Resources.textStyles.textBody1,
      autofocus: autoFocus,
      controller: controller,
      maxLines: maxLines,
      keyboardType: fieldType,
      textDirection: textDirection,
      obscureText: obscureText,
      textInputAction: inputAction ??
          (node != null ? TextInputAction.next : TextInputAction.done),
      onSubmitted: onSubmit,
      onEditingComplete: () => node?.nextFocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 22, 22, 6),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onSuffixIconPressed!,
                iconSize: Resources.dimensions.iconButtonSize,
                icon: Icon(suffixIcon),
              )
            : null,
        prefixIcon: (prefixIcon != null
            ? IconButton(
                onPressed: onPrefixIconPressed!,
                iconSize: Resources.dimensions.iconButtonSize,
                icon: Icon(prefixIcon),
              )
            : null),
        focusedBorder: borderlessStyle ? InputBorder.none : outlineInputBorder,
        errorBorder: borderlessStyle ? InputBorder.none : outlineInputBorder,
        disabledBorder: borderlessStyle ? InputBorder.none : outlineInputBorder,
        border: borderlessStyle ? InputBorder.none : outlineInputBorder,
        enabledBorder: borderlessStyle
            ? InputBorder.none
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide:
                    BorderSide(width: 1.2, color: Colours.colorItemSecondary),
              ),
        focusColor: focusColor,
        labelText: label,
        labelStyle: Resources.textStyles.textBody3,
      ),
    );
  }
}
