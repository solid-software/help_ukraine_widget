import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/widgets/links_card_widget/links_card_button.dart';

/// It's a widget that represents options from
/// that can be tapped to open a link.
class LinksCardWidget extends StatelessWidget {
  /// It's a list of buttons that will be displayed in the card.
  final List<HelpOptionButton> options;

  /// It's a callback that will be called when the user taps
  /// on the 'Hide' button.
  final VoidCallback onClose;

  /// Constructor
  const LinksCardWidget({
    Key? key,
    required this.options,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: options,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 12.0),
                child: Expanded(
                  child: Container(
                    color: const Color(0xffe5e5e5),
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
        LinksCardButton(onTap: onClose),
      ],
    );
  }
}
