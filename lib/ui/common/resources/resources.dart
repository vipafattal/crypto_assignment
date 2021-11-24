import 'package:crypto_assignment/ui/common/resources/strings/ar_string.dart';
import 'package:crypto_assignment/ui/common/resources/strings/strings.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/desktop_text_styles.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/mobile_text_styles.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/tablet_text_styles.dart';
import 'package:crypto_assignment/ui/common/resources/text_styles/text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../orientation_value_builder.dart';
import 'dimensions/desktop_dimensions.dart';
import 'dimensions/dimensions.dart';
import 'dimensions/tablet_dimensions.dart';

class Resources {
  static bool _hasResourcesInitialized = true;
  static int _currentScreenSizeValue = -1;

  static Strings strings = Strings();
  static late TextStyles textStyles;
  static late Dimensions dimensions;
  static late bool extendedView;

  static init(BuildContext context) {
    if (true) {
      textStyles = getValueForScreenType(
        context: context,
        mobile: MobileTextStyles(),
        tablet: TabletTextStyles(),
        desktop: DesktopTextStyles(),
      );

      dimensions = getValueForScreenType(
        context: context,
        mobile: Dimensions(),
        tablet: TabletDimensions(),
        desktop: DesktopDimensions(),
      );

      String languageCode = 'en';
      strings = languageCode == 'ar' ? ArabicStrings() : Strings();
      _hasResourcesInitialized = false;
    }
  }

  static bool _configHasChange(BuildContext context) {
    extendedView = getValueForScreenType(
      context: context,
      mobile: false,
      tablet: getValueForOrientation(context, landscape: true, portrait: false),
      desktop: true,
    );

    final newScreenValueType = getValueForScreenType(
        context: context, mobile: 1, tablet: 2, desktop: 3);

    final requireNewResource = _hasResourcesInitialized ||
        _currentScreenSizeValue != newScreenValueType;

    _currentScreenSizeValue = newScreenValueType;

    return _hasResourcesInitialized || requireNewResource;
  }
}
