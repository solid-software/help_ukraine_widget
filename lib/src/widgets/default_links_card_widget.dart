import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// [LinksCardWidget] with predetermined links
class DefaultLinksCardWidget extends StatelessWidget {
  static const _defaultIconTextStyle = TextStyle(
    fontFamily: FontConfig.family,
    fontSize: 20.8,
    fontWeight: FontWeight.w500,
  );

  /// textStyle for link titles
	final TextStyle? textStyle;

  /// textStyle for icons
  final TextStyle iconTextStyle;

  /// onClose for [LinksCardWidget]
  final void Function() onClose;

  ///
  const DefaultLinksCardWidget({
		super.key,
		this.iconTextStyle = _defaultIconTextStyle,
		this.textStyle,
		required this.onClose,
	});

  @override
  Widget build(BuildContext context) {
    final defaultOptionsList = [
      HelpOptionButton(
				textStyle: textStyle,
        title: 'Donate',
        child: Text(
          Emojis.moneyWithWings,
          style: iconTextStyle,
        ),
      ),
      HelpOptionButton(
				textStyle: textStyle,
        title: 'Support Ukraine',
        child: Text(
          Emojis.heart,
          style: iconTextStyle.apply(
            color: Colors.redAccent,
          ),
        ),
      ),
      HelpOptionButton(
				textStyle: textStyle,
        title: 'Share this widget',
        child: Text(
          Emojis.pushpin,
          style: iconTextStyle,
        ),
      ),
    ];

    return LinksCardWidget(
      options: defaultOptionsList,
      onClose: onClose,
    );
  }
}
