import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/src/components/hover_wrapper.dart';

/// [HelpOptionButton] uses for actions
class HelpOptionButton extends StatelessWidget {
  /// A variable that is used to set the height of the button.
  final double height;

  /// A variable that is used to set the title of the button.
  final String title;

  /// A callback for the button.
  final VoidCallback? onTap;

  /// A variable that is used to set the icon of the button.
  final IconData icon;

  /// A variable to set a background color for button;
  final Color? backgroundColor;

  /// A variable that is used to set the color of the button when the mouse is
  /// hovering over it.
  final Color? hoverColor;

  /// A variable that is used to set the size of the icon.
  final double iconSize;

  static const _defaultHeight = 51.0;
  static const _defaultIconSize = 14.0;

  ///Constructor
  const HelpOptionButton({
    required this.icon,
    required this.title,
    Key? key,
    this.height = _defaultHeight,
    this.iconSize = _defaultIconSize,
    this.onTap,
    this.backgroundColor,
    this.hoverColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWrapper(
      backgroundColor: backgroundColor,
      highlightColor: hoverColor ?? Theme.of(context).highlightColor,
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(icon, size: iconSize),
          ],
        ),
      ),
    );
  }
}
