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

  /// Sets close button`s letter size
  final double? closeButtonFontSize;

  /// Sets huge modification
  final bool isHuge;

  static const _defaultPadding = EdgeInsets.only(
    left: 12.8,
    right: 12.8,
    bottom: 10.4,
    top: 7.4,
  );

  static const _hugePadding = EdgeInsets.only(
    left: 12.8,
    right: 12.8,
    bottom: 8.4,
    top: 7.4,
  );

  /// Constructor
  const LinksCardWidget({
    Key? key,
    required this.options,
    required this.onClose,
    this.closeButtonFontSize,
    this.isHuge = false,
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
          padding: isHuge ? _hugePadding : _defaultPadding,
          child: const Divider(
            height: 0,
          ),
        ),
        LinksCardButton(
          onTap: onClose,
          fontSize: closeButtonFontSize,
        ),
        const SizedBox(
          height: 2,
        )
      ],
    );
  }
}
