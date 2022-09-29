import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:senso_seat/core/constants.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TeslaSample2 extends StatefulWidget {
  @override
  createState() => _TeslaSample2State();
}
class ChipBuilderSample extends ChipBuilder {
  @override
  Widget build(BuildContext context, Widget child, int index, bool active) {
    return Stack(
      alignment: Alignment.center,
      children:  [
        child,
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 10, right: 10),
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Icon(Icons.access_alarm, color: Colors.redAccent),
            ),
          ),
        )
      ],
    );
    ;
  }
}
class _TeslaSample2State extends State<TeslaSample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ConvexAppBar(
          backgroundColor:Color(0xFF30353B) ,
        // style: TabStyle.,
          activeColor: Colors.blue,
          items: [
            TabItem(
              activeIcon:  Icon(
                Icons.accessible,
                color: Colors.white,
                size: 30,
              ) ,
              icon:   Icon(
              Icons.accessible,
              color: Colors.grey,
            ), title: 'Home',),
            TabItem(icon:
            Icon(
              Icons.add_chart_rounded,
              color: Colors.grey,
            ),
                activeIcon:  Icon(
                  Icons.add_chart_rounded,
                  color: Colors.white,
                  size: 30,
                ) ,
                title: 'History'),
            TabItem(icon:Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
                activeIcon:  Icon(
                  Icons.settings_outlined,
                  color: Colors.white,
                  size: 30,
                ) ,

                title: 'Setting'),
            TabItem(icon: Icon(
              Icons.account_box_outlined,
              color: Colors.grey,
            ),
                activeIcon:  Icon(
                  Icons.account_box_outlined,
                  color: Colors.white,
                  size: 30,
                ) ,

                title: 'UserProfile'),
          ],
          onTap: (int i) => print('click index=$i'),
        ),
      body: NeumorphicTheme(
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
          stateOfSeat,
          style: TextStyle(
            color: Colors.white30,
          ),
        ),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 30.0,
            fontFamily: 'Horizon',
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              RotateAnimatedText(normalState),
            ],
            onTap: () {
              print("Tap Event");
            },
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
