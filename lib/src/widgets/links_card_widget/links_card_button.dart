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

  void _onHoverChanged(bool value) {
    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = _isHovered ? HelpColors.blue : Colors.black;
    const fontSize = 16.64;
    const letterSpacing = -0.2;
    const angle = 3.1415;
    const lineWidth = 1.8;
    const scale = 0.9;
    const offset = Offset(7.0, -2.0);
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;

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
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  letterSpacing: letterSpacing,
                ),
          ),
          Transform.translate(
            offset: offset,
            child: Transform.scale(
              scale: scale,
              child: Transform.rotate(
                angle: angle,
                child: ChevronDown(
                  size: const Size(chevronWidth, chevronHeight),
                  color: color,
                  lineWidth: lineWidth,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }
}
