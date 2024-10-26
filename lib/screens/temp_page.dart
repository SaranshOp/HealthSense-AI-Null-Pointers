import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:logger/logger.dart";
import 'package:null_pointers/screens/chat_with_AI.dart';
import 'package:null_pointers/screens/homePage.dart';

import '../widgets/GenerateReportWidget.dart';
import '../widgets/alzehimer_test.dart';
import '../widgets/pneumonia_test.dart';
import '../widgets/top_container.dart';

final logger = Logger();

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

List<List<Color>> bannerCards = [
  [
    Color(0xffa1d4ed),
    Color(0xffc0eaff),
  ],
  [
    Color(0xffb6d4fa),
    Color(0xffcfe3fc),
  ],
];

class _TempPageState extends State<TempPage> {
  Widget? _child;
  @override
  void initState() {
    super.initState();
    _child = HomePage(); // Default content for the home page
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomePage();
          break;
        case 1:
          _child = BookmarkContent();
          break;
        case 2:
          _child = GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFFF9EC),
        body: Stack(children: [
          Container(child: _child!),
          Align(
            alignment: Alignment.bottomCenter,
            child: FluidNavBar(
              icons: [
                FluidNavBarIcon(
                    icon: Icons.add,
                    // svgPath: "assets/home.svg",
                    backgroundColor: const Color(0xFF4285F4),
                    extras: {"label": "home"}),
                FluidNavBarIcon(
                    icon: Icons.bookmark_border,
                    backgroundColor: const Color(0xFFEC4134),
                    extras: {"label": "bookmark"}),
                FluidNavBarIcon(
                    icon: Icons.apps,
                    backgroundColor: const Color(0xFFFCBA02),
                    extras: {"label": "grid"}),
              ],
              onChange: _handleNavigationChange,
              style: const FluidNavBarStyle(
                  iconUnselectedForegroundColor: Colors.white,
                  barBackgroundColor: Color(0xFFF9BE7C)),
              scaleFactor: 1.5,
              defaultIndex: 0,
            ),
          ),
        ]));
  }
}

class BookmarkContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Bookmark Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class GridContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Grid Page", style: TextStyle(fontSize: 24)),
    );
  }
}
