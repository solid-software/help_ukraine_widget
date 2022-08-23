import 'package:flutter/material.dart';

/// Text themes of app
class TextThemes {
  /// A main font of default text theme.
  static const TextStyle mainFont = TextStyle(fontFamily: 'Roboto');

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
