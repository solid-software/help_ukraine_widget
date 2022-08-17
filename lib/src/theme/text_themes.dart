import 'package:flutter/material.dart';

///Text themes of app
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
    // headline5: mainFont.copyWith(fontSize: 20),
    // headline6: mainFont.copyWith(fontSize: 17),
    // bodyText1: mainFont.copyWith(fontSize: 17),
    // bodyText2: mainFont.copyWith(fontSize: 16),
    // subtitle1: mainFont.copyWith(fontSize: 15),
    // subtitle2: mainFont.copyWith(fontSize: 13),
    // caption: mainFont.copyWith(fontSize: 12),
  );

  TextThemes._();
}
