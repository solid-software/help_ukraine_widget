import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';

/// [RoundedButton] is a rounded button with text that states underlined
/// when onHover active.
class RoundedButton extends StatefulWidget {
  /// A function that calls when button pressed.
  final VoidCallback onTap;

  /// A variable that is used to store the title of the button.
  final String title;

  ///Constructor
  const RoundedButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isHovered = false;

  static const _width = 135.0;
  static const _height = 41.59;

  static const _borderRadius = 6.4;

  static const _fontSize = 19.2;
  static const _iconSize = 15.0;

  static const _letterSpacing = -0.6;

  static const _lineWidth = 4.0;
  static const _angle = -3.1415 / 2;
  static const _scale = 0.4;
  static const _offset = Offset(12, 5);

  static const _additionalSpace = 10.0;

  @override
  Widget build(BuildContext context) {
    return HoverWrapper(
      onHoverChanged: (value) {
        setState(() => _isHovered = value);
      },
      onTap: widget.onTap,
      child: Container(
        height: _height,
        width: _width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: HelpColors.lightBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: _additionalSpace,
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: HelpColors.blue,
                    fontSize: _fontSize,
                    height: 1.0,
                    letterSpacing: _letterSpacing,
                    decoration: _isHovered ? TextDecoration.underline : null,
                  ),
            ),
            Transform.scale(
              scale: _scale,
              alignment: Alignment.centerLeft,
              child: Transform.translate(
                offset: _offset,
                child: Transform.rotate(
                  angle: _angle,
                  child: const ChevronDown(
                    size: Size.square(_iconSize),
                    color: HelpColors.blue,
                    lineWidth: _lineWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
