import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:senso_seat/lib/widgets/top_bar.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
          defaultTextColor: Color(0xFF303E57),
          accentColor: Color(0xFF7B79FC),
          variantColor: Colors.black38,
          baseColor: Color(0xFFF8F9FC),
          depth: 8,
          intensity: 0.5,
          lightSource: LightSource.topLeft),
      themeMode: ThemeMode.light,
      child: Material(
        child: NeumorphicBackground(
          child: _ClockFirstPage(),
        ),
      ),
    );
  }
}

class _ClockFirstPage extends StatefulWidget {
  @override
  createState() => _ClockFirstPageState();
}

class _ClockFirstPageState extends State<_ClockFirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
            child: TopBar(
              actions: [],
              title: "",
            ),
          ),
          SizedBox(height: 30),
          SizedBox(height: 60),
          Flexible(child: NeumorphicWheelChair()),
          SizedBox(height: 60),

        ],
      ),
    );
  }
}

class NeumorphicWheelChair extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width*7/8,
      child: Neumorphic(
        // margin: EdgeInsets.all(10),
        // padding: EdgeInsets.all(10),
        style: NeumorphicStyle(
          shadowDarkColor: Colors.blue,
          shadowLightColor: Colors.transparent,
          lightSource: LightSource.left,
          intensity: 0.4,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        // child: Neumorphic(
        //   style: NeumorphicStyle(
        //     depth: 14,
        //     boxShape: NeumorphicBoxShape.circle(),
        //   ),
        //   margin: EdgeInsets.all(20),
        child: Neumorphic(
          // padding: EdgeInsets.all(5),
          style: NeumorphicStyle(
            // depth: -10,
            // shadowDarkColor: Colors.black,
            // shadowLightColor: Colors.red,
            boxShape: NeumorphicBoxShape.circle(),
          ),

          child: AspectRatio(

            aspectRatio: 3 / 4,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                "assets/images/wheelchair_side.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          // margin: EdgeInsets.all(10),
          // child: AspectRatio(
          //   aspectRatio: 3 / 4,
          //   child: Lottie.asset(
          //     'assets/Lottie/chair1.json',
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ),
        // ),
      ),
    );
  }

  Widget _buildLine(
      {required BuildContext context,
        required double angle,
        required double width,
        double height = 6,
        required Color color}) {
    return Transform.rotate(
      angle: angle,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 20,
            ),
            child: Container(
              width: width,
              height: height,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDot(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -10,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: SizedBox(
        height: 10,
        width: 10,
      ),
    );
  }
}
