import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

///
const defaultOptionsList = [
  HelpOptionButton(
    title: 'Donate',
    iconSize: 20,
    child: Text(
      Emojis.moneyWithWings,
      style: TextStyle(
        fontFamily: FontConfig.family,
        fontSize: 20.8,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  HelpOptionButton(
    title: 'Support Ukraine',
    iconSize: 19,
    iconColor: Colors.redAccent,
    child: Text(
      Emojis.heart,
      style: TextStyle(
        fontFamily: FontConfig.family,
        fontSize: 20.8,
        fontWeight: FontWeight.w500,
        color: Colors.redAccent,
      ),
    ),
  ),
  HelpOptionButton(
    title: 'Share this widget',
    iconSize: 19,
    iconColor: Colors.blueAccent,
    child: Text(
      Emojis.pushpin,
      style: TextStyle(
        fontFamily: FontConfig.family,
        fontSize: 20.8,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
];
