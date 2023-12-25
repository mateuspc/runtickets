
import 'package:flutter/material.dart';

class AppDimens {
  AppDimens();

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width <= 500;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.width <= 1000;
  }

  static bool isWeb(BuildContext context) {
    return MediaQuery.of(context).size.width > 1600;
  }
}
