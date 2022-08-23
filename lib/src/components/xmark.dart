import 'package:flutter/material.dart';

/// XMark Icon
class XMark extends StatelessWidget {
	/// size of the canvas to draw a cross on.
  final Size size;

	/// color of the lines.
  final Color color;
  
	/// width of cross lines.
  final double lineWidth;

  /// Constructor
  const XMark({
    Key? key,
    required this.size,
    required this.color,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(	
			size: size,
			painter: _CrossPainter(lineWidth: lineWidth),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final double lineWidth;

	/// constructor
  _CrossPainter({ required this.lineWidth });

  @override
  void paint(Canvas canvas, Size size) { 
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;
    canvas.drawLine(
			Offset.zero,
			Offset(size.width, size.height),
			paint,
		);
    canvas.drawLine(
			Offset(size.width, 0),
			Offset(0, size.height),
			paint,
		); 
	}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
