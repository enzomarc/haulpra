import 'package:flutter/material.dart';
import 'package:haul_pra/data/global_storage/global_storage.dart';

class AppNavigator {
  static NavigatorState _navigator() {
    return Navigator.of(GlobalStorage.navigatorKey.currentState!.context);
  }
  
  static void popScreen() {
    _navigator().pop();
  }

  static void changeScreen(Widget targetPage) {
    _navigator().push(
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  static void replaceScreen(Widget targetPage) {
    _navigator().pushReplacement(
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }

  static void replaceAndRemoveAllScreens(Widget targetPage) {
    _navigator().pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => targetPage),
      (route) => false,
    );
  }
}