import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

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
        _LinksCardButton(onTap: widget.onClose),
      ],
    );
  }
}

class _LinksCardButton extends StatefulWidget {
  final VoidCallback onTap;

  const _LinksCardButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<_LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<_LinksCardButton> {
  bool _isHovered = false;

  static const _iconSize = 13.0;

  void _onHoverChanged(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? HelpColors.blue : Colors.black;

    return HoverWrapper(
      onHoverChanged: _onHoverChanged,
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hide',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: color,
                ),
          ),
          const SizedBox(width: 4),
          Icon(
            SFSymbols.chevron_up,
            color: color,
            size: _iconSize,
          ),
        ],
      ),
    );
  }
}
