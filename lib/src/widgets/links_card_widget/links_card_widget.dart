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

  ///Sets huge modification
  final bool huge;

  static const _hugePadding = EdgeInsets.only(
    top: 7,
    bottom: 9,
    left: 6.4,
    right: 6.4,
  );
  static const _defaultPadding = EdgeInsets.only(
    top: 7,
    bottom: 10,
    left: 6.4,
    right: 6.4,
  );

  /// Constructor
  const LinksCardWidget({
    Key? key,
    required this.options,
    required this.onClose,
    this.huge = false,
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
          padding: huge ? _hugePadding : _defaultPadding,
          child: const Divider(
            height: 0,
          ),
        ),
        LinksCardButton(
          onTap: onClose,
          huge: huge,
        ),
      ],
    );
  }
}
