import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';

/// It's a button that changes color when you hover over it
class DetailsButton extends StatelessWidget {
  /// It's a function that calls on button tap.
  final VoidCallback onTap;

  /// It's a color that changes appearance of text and icon
  final Color color;

  /// It's a variable that stores the title of the button.
  final String title;

  ///Constructor
  const DetailsButton({
    Key? key,
    required this.onTap,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 15.0;

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
              style: theme.textTheme.headline5?.copyWith(
                color: color,
              ),
            ),
            const SizedBox(width: 2),
            Icon(SFSymbols.chevron_down, color: color, size: iconSize),
          ],
        ),
      ),
    );
  }
}
