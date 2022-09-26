import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  bool darkMode = false;
 late  ThemeData customTheme;
@override
  void initState() {

  super.initState();
  }
  @override
  void didChangeDependencies() {
    customTheme=ThemeData(
        brightness: isDark ? Brightness.dark : Brightness.light,
        // Hour & Minute hand.
        primaryColor: isDark ? Colors.grey[400] : Colors.grey[800],
        // Second hand.
        accentColor: Colors.red[800],

        // Shadow color
        canvasColor: isDark ? Colors.grey[900] : Colors.grey[500],
        // Inner shadow color
        dividerColor: isDark ? Colors.grey[900] : Colors.grey[400],
        // Inner Highlight Color
        highlightColor: isDark ? Colors.white.withOpacity(0.08) : Colors.white.withOpacity(0.7),
        backgroundColor: isDark ? Color(0xFF3C4043) : Colors.grey[300],
        textTheme: Theme.of(context).textTheme,
        // switch theme
        toggleableActiveColor: Colors.grey[500],
        // icon colors
        iconTheme: IconThemeData(
            color: Colors.grey[600]
        )
    );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: customTheme.backgroundColor,
            gradient: RadialGradient(
              colors: [
                darkMode
                    ? customTheme.backgroundColor.withOpacity(0.0)
                    : Colors.white.withOpacity(0.0),
                customTheme.dividerColor,
              ],
              center: AlignmentDirectional(0.1, 0.1),
              focal: AlignmentDirectional(0.0, 0.0),
              radius: 0.65,
              focalRadius: 0.001,
              stops: [0.3, 1.0],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: customTheme.backgroundColor,
            gradient: RadialGradient(
              colors: [
                darkMode
                    ? customTheme.backgroundColor.withOpacity(0.0)
                    : Colors.white.withOpacity(0.0),
                darkMode ? Colors.white.withOpacity(0.3) : Colors.white,
              ],
              center: AlignmentDirectional(-0.1, -0.1),
              focal: AlignmentDirectional(0.0, 0.0),
              radius: 0.67,
              focalRadius: 0.001,
              stops: [0.75, 1.0],
            ),
          ),
        ),
      ],
    );
  }
}
// AspectRatio(
// aspectRatio: 3/4,
// child: Lottie.asset(
// 'assets/Lottie/chair1.json',
// fit: BoxFit.fill,
// ),
// ),