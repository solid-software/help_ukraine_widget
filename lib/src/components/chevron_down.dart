import 'package:flutter/material.dart';

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
