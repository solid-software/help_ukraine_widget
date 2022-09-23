import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/src/components/components.dart';
import 'package:help_ukraine_widget/src/theme/theme.dart';

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
  static const _lineHeight = 1.2;
  static const _iconSize = 15.0;

  static const _additionalSpace = 1.0;

  static const _defaultChevronOffset = Offset(4, 2);

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
                    fontWeight: FontWeight.w600,
                    color: HelpColors.blue,
                    fontSize: _fontSize,
                    height: _lineHeight,
                    decoration: _isHovered ? TextDecoration.underline : null,
                  ),
            ),
            Transform.translate(
              offset: _defaultChevronOffset,
              child: const Chevron(
                size: Size.square(_iconSize / 2),
                color: HelpColors.blue,
                lineWidth: 2,
                direction: ChevronDirection.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
