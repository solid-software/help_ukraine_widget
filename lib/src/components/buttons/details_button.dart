import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/src/components/components.dart';
import 'package:help_ukraine_widget/src/theme/font_config.dart';

/// It's a button that changes color when you hover over it
class DetailsButton extends StatelessWidget {
  /// It's a function that calls on button tap.
  final VoidCallback onTap;

  /// It's a color that changes appearance of text and icon
  final Color color;

  /// It's a variable that stores the title of the button.
  final String title;

  ///It's a letter spacing of the title
  final double? letterSpacing;

  ///It's a word spacing of the title
  final double? wordSpacing;

  ///Constructor
  const DetailsButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.title,
    this.letterSpacing,
    this.wordSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const lineWidth = 1.8;
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;
    const fontSize = 19.2;

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
                letterSpacing: letterSpacing ?? 0,
                wordSpacing: wordSpacing ?? 0,
                color: color,
              ),
            ),
            const SizedBox(width: 6),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: SizedBox(
                width: chevronWidth,
                height: chevronHeight,
                child: Chevron(
                  direction: ChevronDirection.down,
                  color: color,
                  size: const Size(chevronWidth, chevronHeight),
                  lineWidth: lineWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
