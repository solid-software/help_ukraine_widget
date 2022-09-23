import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Button that redirects to links view of [HelpWidget]
class LinksCardButton extends StatefulWidget {
  /// onTap for [HoverWrapper]
  final VoidCallback onTap;

  /// Sets close button letter size
  final double? fontSize;

  /// Constructor
  const LinksCardButton({Key? key, required this.onTap, this.fontSize, required this.chevronSize,})
      : super(key: key);
  /// The size of the chevron to the right of the text.
  final Size chevronSize;

  @override
  State<LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<LinksCardButton> {
  bool _isHovered = false;

  static const _defaultFontSize = 16.64;
  
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
          const SizedBox(width: 8),
          Text(
            'Hide',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: color,
                  fontSize: widget.fontSize ?? _defaultFontSize,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7,
              bottom: 2.5,
            ),
            child: Chevron(
              direction: ChevronDirection.up,
              size: widget.chevronSize,
              color: color,
              lineWidth: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
