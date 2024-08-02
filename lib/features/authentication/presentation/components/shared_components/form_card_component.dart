import 'package:flutter/material.dart';
import '../../../../../config/locale/app_localizations.dart';
import '../../../../../core/utils/app_values.dart';

class AnimatedFormCardComponent extends StatefulWidget {
  final Widget widget;
  const AnimatedFormCardComponent({super.key, required this.widget});

  @override
  FormCardComponentState createState() => FormCardComponentState();
}

class FormCardComponentState extends State<AnimatedFormCardComponent>
    with TickerProviderStateMixin { // Change to TickerProviderStateMixin
  late AnimationController _slideController;
  late AnimationController _shadowController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _shadowBlurAnimation;
  late Animation<double> _shadowOffsetAnimation;

  @override
  void initState() {
    super.initState();

    // Controller for sliding animation
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeOut,
      ),
    );

    // Controller for shadow animation with breathing effect
    _shadowController = AnimationController(
      duration: const Duration(seconds: 2), // Duration for one full breath cycle
      vsync: this,
    )..repeat(reverse: true); // Repeat animation with reverse

    _shadowBlurAnimation = Tween<double>(
      begin: 4.0,
      end: 12.0, // Adjust as needed
    ).animate(CurvedAnimation(
      parent: _shadowController,
      curve: Curves.easeInOut,
    ));

    _shadowOffsetAnimation = Tween<double>(
      begin: 0.0,
      end: 6.0, // Adjust as needed
    ).animate(CurvedAnimation(
      parent: _shadowController,
      curve: Curves.easeInOut,
    ));

    // Start the slide animation
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _shadowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: AnimatedBuilder(
        animation: _shadowController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.linearToEaseOut,
            margin: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 15,
              vertical: AppValues.paddingHeight * 30,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: AppLocalizations.of(context)!.isEnLocale
                  ? BorderRadius.only(
                      topLeft: Radius.circular(AppValues.radius * 10),
                      bottomRight: Radius.circular(AppValues.radius * 10),
                      bottomLeft: Radius.circular(AppValues.radius * 10),
                      topRight: Radius.circular(AppValues.radius * 150),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(AppValues.radius * 10),
                      bottomLeft: Radius.circular(AppValues.radius * 10),
                      topLeft: Radius.circular(AppValues.radius * 150),
                      bottomRight: Radius.circular(AppValues.radius * 10),
                    ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  offset: Offset(0, _shadowOffsetAnimation.value),
                  blurRadius: _shadowBlurAnimation.value,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 22,
              vertical: AppValues.paddingHeight * 15,
            ),
            child: SingleChildScrollView(child: widget.widget),
          );
        },
      ),
    );
  }
}
