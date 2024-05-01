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
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(38, 43, 55, 1),
              Color.fromRGBO(28, 29, 39, 1),
            ],
          ))),
          Footer(),
        ]),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
        floatingActionButton: CameraButton(),
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
                  gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(38, 43, 55, 1),
              Color.fromRGBO(28, 29, 39, 1),
            ],
          ))),
          Column(
            children: [header(), Expanded(child: Selectedpage())],
          ),
          const Footer(),
        ]),
        floatingActionButton: CameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}

class CameraScene extends StatelessWidget {
  final CameraController controller;

  CameraScene({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraScreen(controller),
    );
  }
}

class ConfirmScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(children: [
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Footer(),
          ),
          FrostedGlass(),
          ConfirmSceneMain()
        ]),
        resizeToAvoidBottomInset: false,
        floatingActionButton: CameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
