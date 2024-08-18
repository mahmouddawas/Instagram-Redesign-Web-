import 'package:flutter/material.dart';
import 'package:instagram_redesign_web/enum/layouts.dart';

import '../widgets/left_side.dart';
import '../widgets/right_side.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
late Layouts layout;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const LeftSide(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            layout = Layouts.desktop;
            return const Row(
              children: [
                LeftSide(),
                RightSide(),
              ],
            );
          } else if (constraints.maxWidth <= 1000 &&
              constraints.maxWidth >= 600) {
            layout = Layouts.tablet;
            return const Row(
              children: [
                LeftSide(),
                RightSide(),
              ],
            );
          } else {
            layout = Layouts.mobile;
            return const RightSide();
          }
        },
      ),
    );
  }
}
