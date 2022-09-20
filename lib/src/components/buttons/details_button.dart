import 'package:flutter/material.dart';
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
    const lineWidth = 1.8;
    const chevronWidth = 6.4;
    const chevronHeight = 6.4;
    const _offset = Offset(6, 2);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 1.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 19.2,
                fontWeight: FontWeight.w600,
                height: 1.16,
              ).copyWith(
                color: color,
              ),
            ),
            Transform.translate(
              offset: _offset,
              child: ChevronDown(
                color: color,
                size: const Size(chevronWidth, chevronHeight),
                lineWidth: lineWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
