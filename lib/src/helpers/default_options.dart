import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

const _textStyle = TextStyle(
  fontFamily: FontConfig.family,
  fontSize: 17.92,
  fontWeight: FontWeight.w500,
);

const _hugeTextStyle = TextStyle(
  fontFamily: FontConfig.family,
  fontSize: 20.8,
  fontWeight: FontWeight.w500,
);

///
final defaultOptionsList = [
  const HelpOptionButton(
    title: 'Donate',
    child: Text(
      Emojis.moneyWithWings,
      style: _textStyle,
    ),
  ),
  HelpOptionButton(
    title: 'Support Ukraine',
    child: Text(
      Emojis.heart,
      style: _textStyle.apply(
        color: Colors.redAccent,
      ),
    ),
  ),
  const HelpOptionButton(
    title: 'Share this widget',
    child: Text(
      Emojis.pushpin,
      style: _textStyle,
    ),
  ),
];

///
final hugeOptionsList = [
  const HelpOptionButton(
    title: 'Donate',
    height: 51.19,
    fontSize: 20.8,
    horizontalSpacing: 25.6,
    child: Text(
      Emojis.moneyWithWings,
      style: _hugeTextStyle,
    ),
  ),
  HelpOptionButton(
    title: 'Support Ukraine',
    height: 51.19,
    fontSize: 20.8,
    horizontalSpacing: 25.6,
    child: Text(
      Emojis.heart,
      style: _hugeTextStyle.apply(
        color: Colors.redAccent,
      ),
    ),
  ),
  const HelpOptionButton(
    title: 'Share this widget',
    height: 51.19,
    fontSize: 20.8,
    horizontalSpacing: 25.6,
    child: Text(
      Emojis.pushpin,
      style: _hugeTextStyle,
    ),
  ),
];
