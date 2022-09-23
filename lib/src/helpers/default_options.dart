import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/helpers/help_actions.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

const _textStyle = TextStyle(
  fontFamily: FontConfig.family,
  fontSize: 20.8,
  fontWeight: FontWeight.w500,
);

///
final defaultOptionsList = [
  HelpOptionButton(
    title: 'Donate',
    onTap: HelpActions.defaults.donate,
    child: const Text(
      Emojis.moneyWithWings,
      style: _textStyle,
    ),
  ),
  HelpOptionButton(
    title: 'Support Ukraine',
    onTap: HelpActions.defaults.support,
    child: Text(
      Emojis.heart,
      style: _textStyle.apply(
        color: Colors.redAccent,
      ),
    ),
  ),
  HelpOptionButton(
    title: 'Share this widget',
    onTap: HelpActions.defaults.share,
    child: const Text(
      Emojis.pushpin,
      style: _textStyle,
    ),
  ),
];
