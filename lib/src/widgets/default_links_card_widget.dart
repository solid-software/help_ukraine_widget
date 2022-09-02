import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/helpers/emojis.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// [LinksCardWidget] with predetermined links
class DefaultLinksCardWidget extends StatelessWidget {
  /// onClose for [LinksCardWidget]
  final void Function() onClose;

  ///
  const DefaultLinksCardWidget({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    const iconTextStyle = TextStyle(
      fontFamily: FontConfig.family,
      fontSize: 17.92,
      fontWeight: FontWeight.w500,
    );

    final defaultOptionsList = [
      const HelpOptionButton(
        title: 'Donate',
        child: Text(
          Emojis.moneyWithWings,
          style: iconTextStyle,
        ),
      ),
      HelpOptionButton(
        title: 'Support Ukraine',
        child: Text(
          Emojis.heart,
          style: iconTextStyle.apply(
            color: Colors.redAccent,
          ),
        ),
      ),
      const HelpOptionButton(
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
