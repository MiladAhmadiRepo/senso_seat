import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:senso_seat/screens/widgets/network.dart';

import '../screens/widgets/bluethooth.dart';

class ScreenUtility {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}


double getTenPercentOfWidth()=> ScreenUtility.screenWidth * 0.10;
double getThirtyPercentOfWidth()=> ScreenUtility.screenWidth * 0.30;
double getSeventyPercentOfWidth()=> ScreenUtility.screenWidth * 0.70;
double getFivePercentOfHeight()=> ScreenUtility.screenHeight * 0.05;
double getEightPercentOfHeight()=> ScreenUtility.screenHeight * 0.08;
double getFortyPercentOfHeight()=> ScreenUtility.screenHeight * 0.40;
double getThirtyPercentOfHeight()=> ScreenUtility.screenHeight * 0.30;
double getFifteenPercentOfHeight()=> ScreenUtility.screenHeight * 0.15;
double getTenPercentOfHeight()=> ScreenUtility.screenHeight * 0.10;