import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// [HelpOptionButton] uses for actions
class HelpOptionButton extends StatelessWidget {
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

  /// Sets height of widget
  final double? height;

  ///Horizontal padding
  final double? outerHorizontalPadding;

  /// Widget text size
  final double? fontSize;

  static const _defaultHeight = 40.94;
  static const _defaultFontSize = 17.92;
  static const _defaultHorizontalPadding = 20.48;

  static const _wordSpacing = -0.5;

  ///Constructor
  const HelpOptionButton({
    required this.title,
    required this.child,
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.hoverColor,
    this.height,
    this.outerHorizontalPadding,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const hoverOpacity = 0.1;

    return HoverWrapper(
      backgroundColor: backgroundColor,
      highlightColor: hoverColor ?? HelpColors.blue.withOpacity(hoverOpacity),
      onTap: onTap,
      child: Container(
        height: height ?? _defaultHeight,
        padding: EdgeInsets.symmetric(
          horizontal: outerHorizontalPadding ?? _defaultHorizontalPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: theme.textTheme.headline4?.copyWith(
                color: HelpColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? _defaultFontSize,
                wordSpacing: _wordSpacing,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
