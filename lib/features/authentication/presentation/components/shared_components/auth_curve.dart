import 'package:flutter/material.dart';
import 'package:particles_fly/particles_fly.dart';
import '../../../../../core/utils/app_values.dart';
import 'form_card_component.dart';

class AuthCurve extends StatelessWidget {
  final Widget widget;
  final double height;
  const AuthCurve({super.key, required this.widget, this.height = 0.35});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          ParticlesFly(
            height: AppValues.screenHeight,
            width: AppValues.screenWidth,
            particleColor: Theme.of(context).colorScheme.secondary,
            lineColor: Theme.of(context).hintColor,
            connectDots: true,
            numberOfParticles: 40,
          ),
          AnimatedFormCardComponent(
            widget: widget,
          )
        ],
      ),
    );
  }
}
