import 'package:flutter/material.dart';
import '../../../../../config/locale/app_localizations.dart';

class AuthCurve extends StatelessWidget {
  final Widget widget;
  final double height;
  const AuthCurve({super.key, required this.widget, this.height = 0.35});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Stack(children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * height),
            painter: CurvePainter(
                isEn: AppLocalizations.of(context)!.isEnLocale,
                color: Theme.of(context).colorScheme.secondary),
          ),
          widget
        ]));
  }
}

class CurvePainter extends CustomPainter {
  final bool isEn;
  final Color color;
  CurvePainter({required this.isEn, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Get the text direction from the context

    if (!isEn) {
      // Right to left curve
      path.moveTo(size.width, size.height * 0.5);
      path.quadraticBezierTo(size.width * 0.75, size.height * 0.75,
          size.width * 0.5, size.height * 0.5);
      path.quadraticBezierTo(
          size.width * 0.25, size.height * 0.25, 0, size.height * 0.5);
      path.lineTo(0, 0);
      path.lineTo(size.width, 0);
    } else {
      // Left to right curve
      path.moveTo(0, size.height * 0.5);
      path.quadraticBezierTo(size.width * 0.25, size.height * 0.75,
          size.width * 0.5, size.height * 0.5);
      path.quadraticBezierTo(
          size.width * 0.75, size.height * 0.25, size.width, size.height * 0.5);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
