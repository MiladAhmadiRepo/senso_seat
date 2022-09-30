import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:senso_seat/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:senso_seat/screens/widgets/dark_app_bar.dart';

import '../core/color.dart';
import '../core/screen_utility.dart';
import '../core/utility.dart';
import '../custom_outline.dart';

class SensorScreen extends StatefulWidget {
  @override
  createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDarkAppBar(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: mainBackgroundColor,
        style: TabStyle.reactCircle,
        activeColor: Colors.blue,
        top: -10,
        items: [
          TabItem(
            activeIcon: Icon(
              Icons.accessible,
              color: Colors.white,
              size: 30,
            ),
            icon: Icon(
              Icons.accessible,
              color: Colors.grey,
            ),
            title: 'Home',
          ),
          TabItem(
              icon: Icon(
                Icons.add_chart_rounded,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.add_chart_rounded,
                color: Colors.white,
                size: 30,
              ),
              title: 'History'),
          TabItem(
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.settings_outlined,
                color: Colors.white,
                size: 30,
              ),
              title: 'Setting'),
          TabItem(
              icon: Icon(
                Icons.account_box_outlined,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.account_box_outlined,
                color: Colors.white,
                size: 30,
              ),
              title: 'UserProfile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
      body: NeumorphicTheme(
        theme: NeumorphicThemeData(
          baseColor: mainBackgroundColor,
          intensity: 0.3,
          accentColor: activeColor,
          lightSource: LightSource.topLeft,
          depth: 2,
        ),
        child: Scaffold(
          body: SafeArea(
            child: NeumorphicBackground(child: _PageContent()),
          ),
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
  @override
  Widget build(BuildContext context) {
    ScreenUtility().init(context);

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        mainDarkColor,
        mainDarkGlowColor,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 3, child: _buildTopBar(context)),
              Expanded(flex: 3, child: _buildTitle(context)),
              Expanded(flex: 8, child: _buildCenterContent(context)),
              Expanded(
                flex: 2,
                child: _connectionsContainer(
                    Utility().checkBluetoothConnectivity(),
                    Utility().checkNetworkConnectivity()),
              ),
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: _bumpButton(
              Icon(
                Icons.menu,
                color: greyColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            stateOfSeatText,
            style: TextStyle(
              color: Colors.white30,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _avatarButton(ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(25), // Image radius
              child: Image.asset(
                pngUserProfilePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
              // Icon(
              //   Icons.settings,
              //   color: Colors.grey,
              // ),
              ),
        )
      ],
    );
  }

  Widget _bumpButton(Widget child) {
    return Neumorphic(
      drawSurfaceAboveChild: false,
      style: NeumorphicStyle(
        color: mainDarkOuterColor,
        depth: 8,
        boxShape: NeumorphicBoxShape.circle(),
        intensity: 0.5,
        shape: NeumorphicShape.concave,
      ),
      child: NeumorphicButton(
          onPressed: () {},
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(15.0),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            color: mainDarkInnerColor,
            depth: 0,
            shape: NeumorphicShape.convex,
          ),
          child: child),
    );
  }

  Widget _avatarButton(Widget child) {
    return Neumorphic(
      drawSurfaceAboveChild: false,
      style: NeumorphicStyle(
          color: mainDarkOuterColor,
          depth: 8,
          boxShape: NeumorphicBoxShape.circle(),
          intensity: 0.5,
          shape: NeumorphicShape.concave,
          lightSource: LightSource.topRight),
      child: NeumorphicButton(
          onPressed: () {},
          margin: EdgeInsets.all(0),
          // padding: EdgeInsets.all(15.0),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            color: mainDarkInnerColor,
            depth: 0,
            shape: NeumorphicShape.convex,
          ),
          child: child),
    );
  }

  Widget _connectionsContainer(Widget bluetoothWidgets, Widget networkWidgets) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [bluetoothWidgets, networkWidgets],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'Horizon',
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText(normalStateText),
            ],
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildCenterContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            // color: Colors.red,
            child: Text(
              changeYourPositionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          // left: 20,
          // top: 10,
          // child: SizedBox(
          //   height: 250,
          //   width: 300,
          //   child: Image.asset(
          //     pngWheelchairPath,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          child:
          CustomOutline(
            strokeWidth: 10,
            radius:ScreenUtility. screenWidth * 0.8,
            padding: const EdgeInsets.all(0),
            width: ScreenUtility.screenWidth * 0.8,
            height: ScreenUtility.screenWidth * 0.8,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kPinkColor.withOpacity(0.0),
                  kPinkColor.withOpacity(0.0),
                  activeColor.withOpacity(0.2),
                  activeColor.withOpacity(0.3),
                ],
                stops: const [
                  0.2,
                  0.4,
                  0.6,
                  1
                ]),
            child: Container(
              decoration:   BoxDecoration(
                shape: BoxShape.circle,
                // image: DecorationImage(
                  // fit: BoxFit.fill,
                  // image:AssetImage(pngWheelchairPath,)
                // ),
              ),
              child: Image.asset(pngWheelchairPath,),
            ),
          ),
        ),

      ],
    );
  }
}
