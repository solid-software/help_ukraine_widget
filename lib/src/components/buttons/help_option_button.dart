import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [HelpOptionButton] uses for actions
class HelpOptionButton extends StatelessWidget {
  /// A variable that is used to set the height of the button.
  final double height;

  /// A variable that is used to set the title of the button.
  final String title;

  /// A callback for the button.
  final VoidCallback? onTap;

  /// Icon on the right side of the button.
  final Widget child;

  /// A variable to set a background color for button;
  final Color? backgroundColor;

  /// A variable that is used to set the color of the button when the mouse is
  /// hovering over it.
  final Color? hoverColor;

  /// A variable that is used to set the size of the icon.
  final double iconSize;

  /// A variable that is used to set the color of the icon.
  final Color? iconColor;

  static const _defaultHeight = 40.94;
  static const _defaultIconSize = 26.0;
  static const _fontSize = 17.92;

  ///Constructor
  const HelpOptionButton({
    required this.title,
    required this.child,
    Key? key,
    this.height = _defaultHeight,
    this.onTap,
    this.backgroundColor,
    this.hoverColor,
    this.iconSize = _defaultIconSize,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hoverOpacity = 0.1;
    const lineHeight = 0.6;
    const letterSpacing = -0.42;

    return HoverWrapper(
      backgroundColor: backgroundColor,
      highlightColor: hoverColor ?? HelpColors.blue.withOpacity(hoverOpacity),
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20.48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.headline4?.copyWith(
                color: HelpColors.blue,
                fontWeight: FontWeight.w500,
                fontSize: _fontSize
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
