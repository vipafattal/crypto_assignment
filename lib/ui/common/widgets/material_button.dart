import 'package:crypto_assignment/ui/common/resources/resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../colours.dart';

class SimpleMaterialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final BorderRadius? borderRadius;
  final double elevation;
  final double? height, width;
  final bool enabled, withBorder;

  SimpleMaterialButton({
    required this.onPressed,
    required this.child,
    this.padding,
    this.backgroundColor: Colours.colorPrimaryDark,
    this.borderRadius,
    this.height,
    this.width,
    this.elevation: 0.0,
    this.enabled: true,
    this.withBorder: false,
  }) : super();

  SimpleMaterialButton.text({
    required this.onPressed,
    required String text,
    TextStyle? textStyle,
    this.padding,
    Color textColor: Colors.white,
    this.backgroundColor: Colours.colorPrimaryDark,
    this.borderRadius,
    this.height,
    this.width,
    this.elevation: 0.0,
    this.enabled: true,
    this.withBorder: false,
  }) : child = Text(text,
            style: textStyle ??
                Resources.textStyles.textBody6.copyWith(color: textColor));

  SimpleMaterialButton.textWithIcon({
    required this.onPressed,
    required String text,
    IconData? rightIcon,
    IconData? leftIcon,
    TextStyle? textStyle,
    MainAxisAlignment mainAxisAlignment: MainAxisAlignment.spaceBetween,
    MainAxisSize mainAxisSize: MainAxisSize.min,
    this.padding,
    Color textColor: Colors.white,
    Color iconColor: Colors.white,
    this.backgroundColor: Colours.colorPrimaryDark,
    this.borderRadius,
    this.width,
    this.height,
    this.elevation: 0.0,
    this.enabled: true,
    this.withBorder: false,
  }) : child = Row(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: [
              if (leftIcon != null)
                Row(
                  children: [
                    Icon(
                      leftIcon,
                      color: iconColor,
                    ),
                  ],
                ),
              SizedBox(width: 12),
              Text(
                text,
                style: textStyle ??
                    Resources.textStyles.textBody6.copyWith(color: textColor),
              ),
              if (rightIcon != null)
                Row(
                  children: [
                    SizedBox(width: Resources.dimensions.buttonWithIconPadding),
                    Icon(
                      rightIcon,
                      color: iconColor,
                    ),
                  ],
                ),
            ]);

  SimpleMaterialButton.icon({
    required this.onPressed,
    required IconData icon,
    this.padding: EdgeInsets.zero,
    Color iconColor: Colors.white,
    this.backgroundColor: Colours.colorPrimaryDark,
    this.borderRadius,
    this.width,
    this.height,
    this.elevation: 0.0,
    this.enabled: true,
    this.withBorder: false,
  }) : child = Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        );

  SimpleMaterialButton.iconRounded({
    required this.onPressed,
    required IconData icon,
    this.padding: EdgeInsets.zero,
    Color iconColor: Colors.white,
    this.backgroundColor: Colours.colorPrimaryDark,
    double? size,
    this.elevation: 0.0,
    this.enabled: true,
    this.withBorder: false,
  })  : child = Icon(
          icon,
          color: iconColor,
        ),
        width = (size ?? Resources.dimensions.iconButtonSize + 6),
        height = (size ?? Resources.dimensions.iconButtonSize + 6),
        borderRadius =
            BorderRadius.circular(size ?? Resources.dimensions.iconButtonSize);

  @override
  Widget build(BuildContext context) {
    final background = enabled ? backgroundColor : Colours.colorItemSecondary;
    return Container(
      width: width,
      child: ElevatedButton(
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: Resources.dimensions.bigButtonsPadding,
                horizontal: 12,
              ),
          child: child,
        ),
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          padding: padding != null ? MaterialStateProperty.all(padding) : null,
          elevation: MaterialStateProperty.all(elevation),
          backgroundColor: MaterialStateProperty.all(
            background,
          ),
          overlayColor: MaterialStateProperty.all(
              background == Colours.colorPrimary ||
                      background == Colours.colorPrimaryDark
                  ? Colors.transparent
                  : Colours.colorSecondary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: borderRadius ??
                  BorderRadius.circular(Resources.dimensions.itemRadius),
              side: !withBorder
                  ? BorderSide.none
                  : BorderSide(color: Colours.colorItemSecondary, width: 1.5))),
        ),
      ),
    );
  }
}
/*
MaterialStateProperty.all(
              background == Colours.colorPrimary ||
                      background == Colours.colorPrimaryDark
                  ? Colors.transparent
                  : Colors.transparent),
          backgroundColor: MaterialStateProperty.all(
            background,
          )
 */
