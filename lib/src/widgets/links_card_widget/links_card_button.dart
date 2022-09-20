import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';

/// Button that redirects to links view of [HelpWidget]
class LinksCardButton extends StatefulWidget {
  /// onTap for [HoverWrapper]
  final VoidCallback onTap;

  /// Constructor
  const LinksCardButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<LinksCardButton> {
  bool _isHovered = false;

  static const _fontSize = 16.64;
  static const _letterSpacing = 0.0;
  static const _angle = 3.1515;

  void _onHoverChanged(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? HelpColors.blue : HelpColors.black;

    const lineWidth = 1.8;
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;
    const _offset = Offset(3.5, -2.0);
    const _scale = 0.9;

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
                  fontSize: _fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: _letterSpacing,
                ),
          ),
          const SizedBox(width: 3),
          Transform.translate(
            offset: _offset,
            child: Transform.rotate(
              angle: _angle,
              child: Transform.scale(
                scale: _scale,
                child: ChevronDown(
                  color: color,
                  size: const Size(chevronWidth, chevronHeight),
                  lineWidth: lineWidth,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
