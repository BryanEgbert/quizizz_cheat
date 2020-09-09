import 'package:flutter/material.dart';

class ScreenConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}

double screenHeight(double height) {
  double screenHeight = ScreenConfig.screenHeight;
  return (screenHeight * height);
}

double screenWidth(double width) {
  double screenWidth = ScreenConfig.screenWidth;
  return (screenWidth * width);
}
