import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/collectPage/header.dart';
import 'package:collect_the_world/collectPage/selectedPage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:collect_the_world/background/glowingSpots.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const homePage());
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [

          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover)),
          ),
          FrostedGlass(),
          Footer(),
        ]),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
        floatingActionButton: const cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class CapturePage extends StatelessWidget {
  const CapturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover)),
          ),
          FrostedGlass(),
          Column(
            children: [header(), Expanded(child: Selectedpage())],
          ),
          
          Footer(),
        ]),
        floatingActionButton: const cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
