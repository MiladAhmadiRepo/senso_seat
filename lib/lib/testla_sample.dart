import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:senso_seat/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:spring/spring.dart';

class TeslaSample extends StatefulWidget {
  @override
  createState() => _TeslaSampleState();
}

class _TeslaSampleState extends State<TeslaSample> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        baseColor: Color(0xFF30353B),
        intensity: 0.3,
        accentColor: Color(0xFF0F95E6),
        lightSource: LightSource.topLeft,
        depth: 2,
      ),
      child: Scaffold(
        body: SafeArea(
          child: NeumorphicBackground(child: _PageContent()),
        ),
      ),
    );
  }
}

class _PageContent extends StatefulWidget {
  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  final SpringController springController =
      SpringController(initialAnim: Motion.reverse);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFF373C43),
        Color(0xFF17181C),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTopBar(context),
          Expanded(flex: 2, child: _buildTitle(context)),
          Expanded(flex: 5, child: _buildCenterContent(context)),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: _bumpButton(
              Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: _bumpButton(
              Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _bumpButton(Widget child) {
    return Neumorphic(
      drawSurfaceAboveChild: false,
      style: NeumorphicStyle(
        color: Color(0xFF2D3238),
        depth: 8,
        boxShape: NeumorphicBoxShape.circle(),
        intensity: 0.3,
        shape: NeumorphicShape.concave,
      ),
      child: NeumorphicButton(
          onPressed: () {},
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(14.0),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            color: Color(0xFF212528),
            depth: 0,
            shape: NeumorphicShape.convex,
          ),
          child: child),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Tesla",
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
        Text(
          "CyberTruck",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "297",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              "km",
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
        SizedBox(
          height: 200,

          child: Align(
            alignment: Alignment.topCenter,
            child: Spring.flip(
              springController: springController,
              frontWidget: NeumorphicIcon(
                constants.bluetoothIconData,
                style: NeumorphicStyle(
                    // color: Color(0xFF2D3238),
                    shadowDarkColor: Color(0xFF4E5763),
                    shadowLightColor: Color(0xff056bce),
                    depth: 2,
                    intensity: 1),
                size: 120,
              ),
              //required
              rearWidget: NeumorphicIcon(
                constants.bluetoothIconData,
                style: NeumorphicStyle(
                    color: Color(0xFF2D3238),
                    shadowDarkColor: Color(0xC5104566),
                    shadowLightColor: Color(0xC56DBDED),
                    depth: 5,
                    intensity: 1),
                size: 180,
              ),
              //required
              flipAxis: Axis.horizontal,
              //def=Axis.horizantal
              onTap: (side) {
                //only Motion.play and anim Duration are accepted here.
                springController.play();
                print(side); //front or rear
              },
              //you can disable flip on click
              toggleOnClick: false,
              //def=true
              animDuration: Duration(seconds: 2), //def=1s
            ),
          ),
        ),

        Positioned(
        left: 20,
          child: SizedBox(
            height: 280,
            child: Image.asset(
              // "assets/images/tesla_cropped.png",
              "assets/images/wheelchair_side.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
