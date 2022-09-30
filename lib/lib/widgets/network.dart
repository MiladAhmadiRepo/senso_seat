import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/color.dart';
import '../../core/constants.dart';

class NetworkWidgets {
  static Widget activeNetwork() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          activeText,
          style: TextStyle(color: activeColor, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 3,
        ),
        Lottie.asset(
          lottieActiveNetwork,
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),

      ],
    );
  }

  static Widget deActiveNetwork() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          deActiveText,
          style: TextStyle(color: deActiveColor, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 3,
        ),
        Lottie.asset(
          animate: false,
          lottieDeActiveNetwork,
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),

      ],
    );
  }
}
