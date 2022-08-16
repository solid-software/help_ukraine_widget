import 'dart:math' as math;
import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color hoverColor;
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
    const arrowRotateAngle = -math.pi / 2;

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
              // 'See what you can do',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: hoverColor,
                  ),
            ),
            Transform.rotate(
              angle: arrowRotateAngle,
              child: Icon(Icons.chevron_left, color: hoverColor),
            ),
          ],
        ),
      ),
    );
  }
}
