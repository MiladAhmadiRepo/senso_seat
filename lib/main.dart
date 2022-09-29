import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:senso_seat/clock/clock_sample.dart';
import 'package:senso_seat/home_page.dart';

import 'lib/LineChartSample2.dart';
import 'lib/testla_sample.dart';
import 'lib/testla_sample2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      // body: ClockSample(),
      body: TeslaSample(),
      // body: LineChartSample2(),
    );
  }
}
