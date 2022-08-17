import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

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
              // 'See what you can do',
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
