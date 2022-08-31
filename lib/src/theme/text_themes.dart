import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// Text themes of app
class TextThemes {
  /// A main font of default text theme.
  static const TextStyle mainFont = TextStyle(fontFamily: FontConfig.family);

  /// A default TextTheme for main theme.
  static final TextTheme defaultTextTheme = TextTheme(
    headline4: mainFont.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline5: mainFont.copyWith(
      fontSize: 19.2,
      fontWeight: FontWeight.w500,
    ),
  );

  TextThemes._();
}
