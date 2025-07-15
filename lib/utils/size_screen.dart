import 'package:flutter/material.dart';

class SizeScreen {
  // Singleton pattern
  SizeScreen._privateConstructor();
  static final SizeScreen instance = SizeScreen._privateConstructor();

  // Create methods to access screen size dynamically
  double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double safeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  double safeAreaBottom(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}