import 'dart:ffi';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/globals/globalScripts/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/itemToFindUpdater.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmScene.dart';
import 'package:collect_the_world/globals/globalScripts/cameraController.dart';
import 'package:collect_the_world/globals/globalScripts/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/contentContainer.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/pages/homePage/collectPage/selectedPage.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/globals/globalScripts/dailyStreak.dart'
    as globalStreakFile;
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Making status bar transparent
  ));
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  LoadDailyStreak dailyStreak = LoadDailyStreak();
  int dailyStreakNum = 0;

  @override
  initState() {
    super.initState();
    initCamera();
    dailyStreak.loadStreak();
    setState(() {
      dailyStreakNum = globalStreakFile.streak;
    });
  }

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
          CustomHeader(dailStreakNum: dailyStreakNum),
          ContentContainer(),
          const Footer(),
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
          const BackgroundGradiant(),
          Column(
            children: [
              const SizedBox(
                height: 125,
              ),
              Expanded(child: Selectedpage())
            ],
          ),
          CustomHeader(dailStreakNum: globalStreakFile.streak),
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
  final dailyWeeklyItem;
  final itemName;

  CameraScene(
      {required this.controller,
      this.dailyWeeklyItem = false,
      this.itemName = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CameraScreen(
        controller: controller,
        dailyWeeklyItem: dailyWeeklyItem,
        itemName: itemName,
      ),
    );
  }
}

class ConfirmScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: const Stack(
            children: [BackgroundGradiant(), Footer(), ConfirmSceneMain()]),
        resizeToAvoidBottomInset: false,
        floatingActionButton: CameraButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
