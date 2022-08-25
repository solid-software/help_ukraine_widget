import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// It's a button that changes color when you hover over it
class DetailsButton extends StatelessWidget {
  /// It's a function that calls on button tap.
  final VoidCallback onTap;

  /// It's a color that changes appearance of text and icon
  final Color color;

  /// It's a variable that stores the title of the button.
  final String title;

  /// fontSize for title
  final double fontSize;

  /// letterSpacing for title
  final double letterSpacing;

  /// how much free space should be between title and chevron
  final double spacingToChevron;

  /// how much free space should be after chevron
  final double spacingAfterChevron;

  static const _defaultFontSize = 19.2;
  static const _defaultLetterSpacing = -0.49;
  static const _defaultSpacingToChevron = 2.0;
  static const _defaultSpacingAfterChevron = 0.0;

  ///Constructor
  const DetailsButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.title,
    this.fontSize = _defaultFontSize,
    this.letterSpacing = _defaultLetterSpacing,
    this.spacingToChevron = _defaultSpacingToChevron,
    this.spacingAfterChevron = _defaultSpacingAfterChevron,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lineWidth = 1.8;
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontConfig.family,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: letterSpacing,
                color: color,
              ),
            ),
            SizedBox(width: spacingToChevron),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SizedBox(
                width: chevronWidth,
                height: chevronHeight,
                child: ChevronDown(
                  color: color,
                  size: const Size(chevronWidth, chevronHeight),
                  lineWidth: lineWidth,
                ),
              ),
            ),
            SizedBox(width: spacingAfterChevron),
          ],
        ),
      ),
    );
  }
}
