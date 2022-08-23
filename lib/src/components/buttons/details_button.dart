import 'package:flutter/material.dart';
// import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
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
              style: theme.textTheme.headline5?.copyWith(
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

/// chevron Icon
class ChevronDown extends StatelessWidget {
	/// size of the canvas to draw a chevron on.
  final Size size;

	/// color of the lines.
  final Color color;
  
	/// width of chevron lines.
  final double lineWidth;


  /// Constructor
  const ChevronDown({
    Key? key,
    required this.size,
    required this.color,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(	
			size: size,
			painter: _CrossPainter(
				color: color,
				lineWidth: lineWidth,
			),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final double lineWidth;
	final Color color;

	/// constructor
  _CrossPainter({
		required this.color,
		required this.lineWidth,
	});

  @override
  void paint(Canvas canvas, Size size) { 
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

		final halfWidth = size.width / 2;
		final halfHeight = size.height / 2;

		final halfLine = lineWidth / 2;

		final x = halfLine / 2;

    canvas.drawLine(
			Offset.zero,
			Offset(halfWidth + x, halfHeight + x),
			paint,
		);
    canvas.drawLine(
			Offset(size.width, 0),
			Offset(halfWidth - x, halfHeight + x),
			paint,
		); 
	}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

