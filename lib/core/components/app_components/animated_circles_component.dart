


import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/app_values.dart';

class AnimatedCircles extends StatefulWidget {
  const AnimatedCircles({super.key});

  @override
  AnimatedCirclesState createState() => AnimatedCirclesState();
}

class AnimatedCirclesState extends State<AnimatedCircles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Circle> circles;
  final int numberOfCircles = 20;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    circles = List.generate(numberOfCircles, (index) {
      return Circle(
        offset: Offset(random.nextDouble() * 300, random.nextDouble() * 600),
        velocity: Offset(
            (random.nextDouble() - 0.5) * 10, (random.nextDouble() - 0.5) * 10),
        radius: 10 + random.nextDouble() * 20,
      );
    });

    _controller.addListener(() {
      setState(() {
        for (var circle in circles) {
          circle.update();
          circle.checkBounds(const Size(300, 600));
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(circles),
      child: SizedBox(
          width: AppValues.screenWidth, height: AppValues.screenHeight),
    );
  }
}

class Circle {
  Offset offset;
  Offset velocity;
  double radius;

  Circle({required this.offset, required this.velocity, required this.radius});

  void update() {
    offset += velocity;
  }

  void checkBounds(Size size) {
    if (offset.dx < 0 || offset.dx > size.width) {
      velocity = Offset(-velocity.dx, velocity.dy);
    }
    if (offset.dy < 0 || offset.dy > size.height) {
      velocity = Offset(velocity.dx, -velocity.dy);
    }
  }
}

class CirclePainter extends CustomPainter {
  final List<Circle> circles;
  CirclePainter(this.circles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;

    for (var circle in circles) {
      canvas.drawCircle(circle.offset, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
