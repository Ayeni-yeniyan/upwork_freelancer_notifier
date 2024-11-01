import 'package:flutter/material.dart';
import 'package:notifyme/core/theme/app_pallete.dart';

class RectangleWithCircularCutWidget extends StatelessWidget {
  final Color color;
  const RectangleWithCircularCutWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectangleWithCircularCutPainter(rectangleColor: color),
    );
  }
}

class RectangleWithCircularCutPainter extends CustomPainter {
  final Color rectangleColor;
  final double circleRadius;

  RectangleWithCircularCutPainter({
    this.circleRadius = 40,
    required this.rectangleColor,
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
