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
    return RotatedBox(
      quarterTurns: _quartedTurnsForDirection(direction),
      child: CustomPaint(
        size: size,
        painter: _CrossPainter(
          color: color,
          lineWidth: lineWidth,
        ),
      ),
    );
  }

  int _quartedTurnsForDirection(ChevronDirection direction) {
    return const {
          ChevronDirection.down: 0,
          ChevronDirection.left: 1,
          ChevronDirection.up: 2,
          ChevronDirection.right: 3,
        }[direction] ??
        0;
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
