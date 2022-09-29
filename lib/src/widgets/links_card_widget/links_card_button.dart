import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Button that redirects to links view of [HelpUkraineWidget]
class LinksCardButton extends StatefulWidget {
  /// onTap for [HoverWrapper]
  final VoidCallback onTap;

  /// Sets close button letter size
  final double? fontSize;

  /// The size of the chevron to the right of the text.
  final Size chevronSize;

  /// Chevron padding
  final EdgeInsets? chevronPadding;

  /// Additional spacing before text
  final double? additionalSpacing;

  /// Constructor
  const LinksCardButton({
    Key? key,
    required this.onTap,
    this.fontSize,
    required this.chevronSize,
    this.chevronPadding,
    this.additionalSpacing,
  }) : super(key: key);

  @override
  State<LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<LinksCardButton> {
  bool _isHovered = false;

  static const _defaultFontSize = 16.64;
  static const _defaultChevronPadding = EdgeInsets.only(
    left: 7,
    bottom: 2.5,
  );
  static const double _defaultAdditionalSpacing = 4.0;

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
          SizedBox(
            width: widget.additionalSpacing ?? _defaultAdditionalSpacing,
          ),
          Text(
            'Hide',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: color,
                  fontSize: widget.fontSize ?? _defaultFontSize,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Padding(
            padding: widget.chevronPadding ?? _defaultChevronPadding,
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
