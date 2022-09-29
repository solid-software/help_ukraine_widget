import 'package:flutter/material.dart';

/// chevron Icon
class Chevron extends StatelessWidget {
  /// size of the canvas to draw a chevron on.
  final Size size;

  /// color of the lines.
  final Color color;

  /// width of chevron lines.
  final double lineWidth;

  /// Direction where the chevron point will be facing.
  final ChevronDirection direction;

  /// Constructor
  const Chevron({
    Key? key,
    required this.size,
    required this.color,
    required this.lineWidth,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _ChevronPainter(
        color: color,
        lineWidth: lineWidth,
        radians: _getRadiansForDirection(direction),
      ),
    );
  }

  double _getRadiansForDirection(ChevronDirection direction) {
    const double _pi = 3.1415;
    const double _halfOfPi = _pi / 2;

    return {
          ChevronDirection.down: 0.0,
          ChevronDirection.left: _halfOfPi,
          ChevronDirection.up: _pi,
          ChevronDirection.right: -_halfOfPi,
        }[direction] ??
        0.0;
  }
}

/// The direction where the chevron arrow will be pointing.
enum ChevronDirection {
  /// Chevron pointing upwards
  up,

  /// Chevron pointing to the right
  right,

  /// Chevron pointing downwards
  down,

  /// Chevron pointing to the left
  left
}

class _ChevronPainter extends CustomPainter {
  final double lineWidth;
  final Color color;
  final double radians;

  /// constructor
  _ChevronPainter({
    required this.color,
    required this.lineWidth,
    required this.radians,
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

    canvas.rotate(radians);

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
