import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/color.dart';

PreferredSizeWidget getDarkAppBar(){
  return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: mainStatusBarColor,
      )
  );
}