import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:senso_seat/screens/widgets/top_bar.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // List<Widget> ListOfPageView = [
  //   HomeBody() ,
  //   RoutineScreen(),
  //   DevicesScreen(),
  //   Scaffold(),
  // ];
  // @override
  // Widget build(BuildContext context) {
  //   SizeConfig().init(context);
  //   return BlocConsumer<HomeBloc, HomeState>(
  //       listener: (context, state) {},
  //       builder: (context, state) {
  //         return Scaffold(
  //           body: buildPageView(context),
  //           bottomNavigationBar: getCustomBottomNavBar(context.read<HomeBloc>()),
  //         );
  //       });
  // }
  //
  // Widget buildPageView(BuildContext context) {
  //   return PageView.builder(
  //     controller: context.read<HomeBloc>().pageController,
  //     onPageChanged: (index) {
  //       context.read<HomeBloc>().add(PageChangedEvent(index));
  //     },
  //     itemCount: ListOfPageView.length,
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListOfPageView[index];
  //     },
  //   );
  // }
}

