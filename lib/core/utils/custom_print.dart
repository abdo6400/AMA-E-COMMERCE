import 'package:flutter/foundation.dart';

class CustomPrint {
  static void printRoute(String text) {
    if (kDebugMode) {
      printInBox('\x1B[34m[ROUTE]\x1B[0m $text', '\x1B[34m'); // Blue for route
    }
  }

  static void printBlocEvent(String text) {
    if (kDebugMode) {
      printInBox(
          '\x1B[36m[BLOC]\x1B[0m $text', '\x1B[36m'); // Cyan for Bloc events
    }
  }

  static void printRequest(String text) {
    if (kDebugMode) {
      printInBox(
          '\x1B[34m[REQUEST]\x1B[0m $text', '\x1B[34m'); // Blue for request
    }
  }

  static void printResponse(String text) {
    if (kDebugMode) {
      printInBox(
          '\x1B[32m[RESPONSE]\x1B[0m $text', '\x1B[32m'); // Green for response
    }
  }

  static void printError(String text) {
    if (kDebugMode) {
      printInBox('\x1B[31m[ERROR]\x1B[0m $text', '\x1B[31m'); // Red for error
    }
  }

  static void printInBox(String text, String colorCode) {
    final border =
        '${'$colorCode-' * (text.length + 4)}\x1B[0m'; // Colored border

    if (kDebugMode) {
      print(border);
      print('$colorCode-${' ' * 2}$text${' ' * 2}-\x1B[0m');
      print(border);
    }
  }

  static void printFullText(String text) {
    final pattern =
        RegExp('.{1,800}'); // Splits text into chunks of 800 characters
    for (var match in pattern.allMatches(text)) {
      debugPrint(match.group(0));
    }
  }
}
