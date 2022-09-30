import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

import '../../core/color.dart';
import '../../core/constants.dart';

class BlueToothWidgets {

  static Widget activeBlueTooth() {
   return Row(
     mainAxisSize: MainAxisSize.min,
     children: [
       Lottie.asset(
         lottieActiveBluetoothPath,
         height: 50,
         width: 50,
         fit: BoxFit.contain,
       ),
       SizedBox(width: 3,),
       const Text(activeText,style: TextStyle(color:activeColor,fontWeight: FontWeight.w400),)
     ],
   );

  }
  static Widget deActiveBlueTooth(   ) {
    return
      Row(
      mainAxisSize: MainAxisSize.min,

      children: [
        Lottie.asset(
          animate: false,
          lottieDeActiveBluetoothPath,
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 3,),
        const Text(deActiveText,style: TextStyle(color:deActiveColor,fontWeight: FontWeight.w400),)
      ],
    );
  }
}
