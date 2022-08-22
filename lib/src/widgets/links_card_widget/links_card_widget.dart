import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/widgets/links_card_widget/links_card_button.dart';

/// It's a widget that represents options from
/// that can be tapped to open a link.
class LinksCardWidget extends StatefulWidget {
  /// It's a list of buttons that will be displayed in the card.
  final List<HelpOptionButton> options;

  /// It's a callback that will be called when the user taps
  /// on the 'Hide' button.
  final VoidCallback onClose;

  ///Constructor
  const LinksCardWidget({
    Key? key,
    required this.options,
    required this.onClose,
  }) : super(key: key);

  @override
  State<LinksCardWidget> createState() => _LinksCardWidgetState();
}

class _LinksCardWidgetState extends State<LinksCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: widget.options,
        ),
        const Divider(height: 20),
        LinksCardButton(onTap: widget.onClose),
      ],
    );
  }
}
