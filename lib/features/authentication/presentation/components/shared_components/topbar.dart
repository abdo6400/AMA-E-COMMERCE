import 'package:flutter/material.dart';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_values.dart';
import '../../../../../core/utils/app_images.dart';

class TopBar extends StatefulWidget {
  final String title;
  final String subTitle;

  const TopBar({super.key, required this.title, required this.subTitle});

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _rotateAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: FadeTransition(
                  opacity: _fadeInAnimation,
                  child: Text(widget.title.tr(context),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!),
                ),
              ),
              Flexible(
                flex: 1,
                child: RotationTransition(
                  turns: _rotateAnimation,
                  child: Material(
                    elevation: 1,
                    type: MaterialType.circle,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: CircleAvatar(
                      radius: AppValues.radius * 40,
                      backgroundImage: const AssetImage(AppImages.appLogo),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 35,
          ),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: Text(
              widget.subTitle.tr(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
