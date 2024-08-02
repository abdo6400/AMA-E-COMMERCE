import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:particles_fly/particles_fly.dart';
import '../../../../../core/utils/app_values.dart';

class AuthCurve extends StatelessWidget {
  final Widget widget;
  final double height;
  const AuthCurve({super.key, required this.widget, this.height = 0.35});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(children: [
        // const AnimatedCircles(),
        ParticlesFly(
            height: AppValues.screenHeight,
            width: AppValues.screenWidth,
            particleColor: Theme.of(context).colorScheme.secondary,
            lineColor: Theme.of(context).hintColor,
            connectDots: true,
            numberOfParticles: 40),
        Card(
          margin: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 15,
              vertical: AppValues.paddingHeight * 30),
          elevation: 1,
          shadowColor: Theme.of(context).colorScheme.secondary,
          //color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          shape: RoundedRectangleBorder(
              borderRadius: AppLocalizations.of(context)!.isEnLocale
                  ? BorderRadius.only(
                      topLeft: Radius.circular(
                        AppValues.radius * 10,
                      ),
                      bottomRight: Radius.circular(
                        AppValues.radius * 10,
                      ),
                      bottomLeft: Radius.circular(
                        AppValues.radius * 10,
                      ),
                      topRight: Radius.circular(
                        AppValues.radius * 150,
                      ))
                  : BorderRadius.only(
                      topRight: Radius.circular(
                        AppValues.radius * 10,
                      ),
                      bottomLeft: Radius.circular(
                        AppValues.radius * 10,
                      ),
                      topLeft: Radius.circular(
                        AppValues.radius * 150,
                      ),
                      bottomRight: Radius.circular(
                        AppValues.radius * 10,
                      ),
                    )),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 22,
                vertical: AppValues.paddingHeight * 15),
            child: SingleChildScrollView(child: widget),
          ),
        ),
      ]),
    );
  }
}
