import 'package:flutter/material.dart';
import '../../core/utils/custom_print.dart';

class RouteLogger extends RouteObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    CustomPrint.printTest(
        'Route pushed -- ${route.settings.name}, ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    CustomPrint.printTest(
        'Route popped -- ${route.settings.name},${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    CustomPrint.printTest(
        'Route removed -- ${route.settings.name},${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    CustomPrint.printTest(
        'Route replaced -- ${newRoute?.settings.name}, ${oldRoute?.settings.name}');
  }
}
