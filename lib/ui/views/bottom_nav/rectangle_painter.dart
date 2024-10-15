import 'package:flutter/material.dart';

class RectangleWithCircularCutWidget extends StatelessWidget {
  const RectangleWithCircularCutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectangleWithCircularCutPainter(),
    );
  }
}

class RectangleWithCircularCutPainter extends CustomPainter {
  final Color rectangleColor;
  final double circleRadius;

  RectangleWithCircularCutPainter({
    this.rectangleColor = Colors.white,
    this.circleRadius = 40,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = rectangleColor
      ..style = PaintingStyle.fill;

    // Create rectangle path
    final Path rectanglePath = Path()
      ..addRect(
        Rect.fromLTWH(0, size.height - 80, size.width, 100),
      );

    // Create circle path
    final Path circlePath = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height - 80),
          height: 80,
          width: 85,
        ),
      );

    // Combine paths by subtracting circle from rectangle
    final Path combinedPath = Path.combine(
      PathOperation.difference,
      rectanglePath,
      circlePath,
    );

    // Draw the combined path
    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant RectangleWithCircularCutPainter oldDelegate) {
    return oldDelegate.rectangleColor != rectangleColor ||
        oldDelegate.circleRadius != circleRadius;
  }
}
