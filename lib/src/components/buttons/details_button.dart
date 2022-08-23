import 'package:flutter/material.dart';
import 'package:help_ukraine_widget/help_ukraine_widget.dart';
import 'package:help_ukraine_widget/src/components/chevron_down.dart';

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
    // const iconSize = 15.0;

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
								fontFamily: 'Roboto',
                // letterSpacing: -0.9,
                fontSize: 19.2,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            const SizedBox(width: 2),
            // Icon(SFSymbols.chevron_down, color: color, size: iconSize),
						Container(
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
          ],
        ),
      ),
    );
  }
}
