import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

/// It's a button that changes color when you hover over it
class DetailsButton extends StatelessWidget {
  /// It's a function that calls on button tap.
  final VoidCallback onTap;

  /// It's a color that changes when you hover over the button.
  final Color hoverColor;

  /// It's a variable that stores the title of the button.
  final String title;

  ///Constructor
  const DetailsButton({
    Key? key,
    required this.onTap,
    required this.hoverColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = 17.0;

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
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: hoverColor,
                  ),
            ),
            Icon(SFSymbols.chevron_down, color: hoverColor, size: iconSize),
          ],
        ),
      ),
    );
  }
}
