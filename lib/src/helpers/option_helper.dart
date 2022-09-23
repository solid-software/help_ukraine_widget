import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/helpers/help_actions.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// Class that helps get correct options list
class OptionHelper {
  ///
  static const _defaultFontSize = 17.92;

  static const _dafaultTextStyle = TextStyle(
    fontFamily: FontConfig.family,
    fontSize: 17.92,
    fontWeight: FontWeight.w500,
  );

  OptionHelper._();

  /// Options list
  static List<HelpOptionButton> getOptionsList({
    double? fontSize = _defaultFontSize,
    double? height,
    double? outerHorizontalPadding,
  }) {
    return [
      HelpOptionButton(
        title: 'Donate',
        onTap: HelpActions.defaults.donate,
        fontSize: fontSize,
        height: height,
        outerHorizontalPadding: outerHorizontalPadding,
        child: Text(
          Emojis.moneyWithWings,
          style: _dafaultTextStyle.copyWith(
            fontSize: fontSize,
          ),
        ),
      ),
      HelpOptionButton(
        title: 'Support Ukraine',
        onTap: HelpActions.defaults.support,
        fontSize: fontSize,
        height: height,
        outerHorizontalPadding: outerHorizontalPadding,
        child: Text(
          Emojis.heart,
          style: _dafaultTextStyle.apply(color: Colors.redAccent).copyWith(
                fontSize: fontSize,
              ),
        ),
      ),
      HelpOptionButton(
        title: 'Share this widget',
        onTap: HelpActions.defaults.share,
        fontSize: fontSize,
        height: height,
        outerHorizontalPadding: outerHorizontalPadding,
        child: Text(
          Emojis.pushpin,
          style: _dafaultTextStyle.copyWith(
            fontSize: fontSize,
          ),
        ),
      ),
    ];
  }
}
