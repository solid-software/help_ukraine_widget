import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// [LinksCardWidget] with predetermined links
class DefaultLinksCardWidget extends StatelessWidget {
  static const _defaultTextStyle = TextStyle(
    fontFamily: FontConfig.family,
    fontSize: 20.8,
    fontWeight: FontWeight.w500,
  );

  /// textStyle for link titles
  final TextStyle textStyle;

  /// onClose for [LinksCardWidget]
  final void Function() onClose;

  ///
  const DefaultLinksCardWidget(
      {super.key, this.textStyle = _defaultTextStyle, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final defaultOptionsList = [
      HelpOptionButton(
        title: 'Donate',
        child: Text(
          Emojis.moneyWithWings,
          style: textStyle,
        ),
      ),
      HelpOptionButton(
        title: 'Support Ukraine',
        child: Text(
          Emojis.heart,
          style: textStyle.apply(
            color: Colors.redAccent,
          ),
        ),
      ),
      HelpOptionButton(
        title: 'Share this widget',
        child: Text(
          Emojis.pushpin,
          style: textStyle,
        ),
      ),
    ];

    return LinksCardWidget(
      options: defaultOptionsList,
      onClose: onClose,
    );
  }
}
