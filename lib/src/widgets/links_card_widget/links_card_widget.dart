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

  ///It's size of letters for close button
  final double? closeButtonFontSize;

  /// Padding for diveder
  final EdgeInsets dividerPadding;

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
    this.closeButtonFontSize,
    this.dividerPadding = _defaultPadding,
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
          padding: dividerPadding,
          child: const Divider(
            height: 0,
          ),
        ),
        LinksCardButton(
          onTap: onClose,
          fontSize: closeButtonFontSize,
        ),
      ],
    );
  }
}
