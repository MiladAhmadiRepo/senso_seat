import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      // padding: EdgeInsets.all(10),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        // shape: NeumorphicShape.flat,
      ),
      // child: Icon(
      //   Icons.menu,
      //   color: NeumorphicTheme.isUsingDark(context)
      //       ? Colors.white70
      //       : Colors.black87,
      // ),
      child: CircleAvatar(
        backgroundImage: AssetImage(
          "assets/images/mohammad.png",
        ),

      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
