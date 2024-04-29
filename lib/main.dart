import 'dart:ffi';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:collect_the_world/background/backgroundImage.dart';
import 'package:collect_the_world/cameraScene/cameraScene.dart';
import 'package:collect_the_world/cameraScene/confirm/confirmScene.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/collectPage/header.dart';
import 'package:collect_the_world/collectPage/selectedPage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
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
          backgroundImage(),
          FrostedGlass(),
          Footer(),
        ]),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
        floatingActionButton: cameraButton(),
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
          backgroundImage(),
          FrostedGlass(),
          Column(
            children: [header(), Expanded(child: Selectedpage())],
          ),
          Footer(),
        ]),
        floatingActionButton: cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}

class cameraScene extends StatelessWidget {
  final CameraController controller;

  cameraScene({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraScreen(controller),
    );
  }
}

class confirmScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(children: [
          backgroundImage(),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          ),
          FrostedGlass(),
          confirmSceneMain()
        ]),
        resizeToAvoidBottomInset: false,
        floatingActionButton: cameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
