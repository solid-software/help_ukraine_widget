import 'package:flutter/material.dart';

import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// Button that redirects to links view of [HelpWidget]
class LinksCardButton extends StatefulWidget {
  /// onTap for [HoverWrapper]
  final VoidCallback onTap;

  /// The size of the chevron to the right of the text.
  final Size chevronSize;

  /// Constructor
  const LinksCardButton({
    Key? key,
    required this.onTap,
    required this.chevronSize,
  }) : super(key: key);

  @override
  State<LinksCardButton> createState() => _LinksCardButtonState();
}

class _LinksCardButtonState extends State<LinksCardButton> {
  bool _isHovered = false;

  void _onHoverChanged(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? HelpColors.blue : Colors.black;
    const fontSize = 19.0;

    return HoverWrapper(
      onHoverChanged: _onHoverChanged,
      onTap: widget.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 2),
          Text(
            'Hide',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: color,
                  fontSize: fontSize,
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
