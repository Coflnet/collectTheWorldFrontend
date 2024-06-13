import 'dart:ffi';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/challengeCaching.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmScene.dart';
import 'package:collect_the_world/globals/globalScripts/cameraController.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/contentContainer.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/pages/homePage/collectPage/itemSlidingPage.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as globalStreakFile;
import 'package:collect_the_world/globals/globalKeys.dart' as globalKeys;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color.fromRGBO(21, 31, 51, 1),
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
  int dailyQuestCompletion = 0;

  @override
  initState() {
    super.initState();
    authclie.Authclient().initClient();
    ListCaching().loadCache();
    ListCaching().checkIfItemUpdated();
    dailyStreak.loadStreak();
    loadChallenge();
    setState(() {
      dailyStreakNum = globalStreakFile.streak;
    });
  }

  void loadChallenge() async {
    Challenge dailyChallenge = await ChallengeCaching().getDailyChallenge();

    setState(() {
      dailyQuestCompletion = dailyChallenge.progress!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => PopupNotifier(),
          child: Stack(children: [
            const BackgroundGradiant(),
            CustomHeader(dailStreakNum: dailyStreakNum),
            const ConformationPopup(),
            ContentContainer(collectionPercentage: dailyQuestCompletion,),
            const Footer(),
          ]),
        ),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
        floatingActionButton: const CameraButtonFooter(),
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
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Stack(children: [
          const BackgroundGradiant(),
          const Column(
            children: [
              SizedBox(
                height: 125,
              ),
              Expanded(child: Selectedpage())
            ],
          ),
          CustomHeader(dailStreakNum: globalStreakFile.streak),
          const Footer(),
        ]),
        floatingActionButton: const CameraButtonFooter(),
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
  final bool isItemToFind;

  const ConfirmScene({super.key, this.isItemToFind = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        body: Stack(children: [
          const BackgroundGradiant(),
          const Footer(),
          ConfirmSceneMain(
            isItemToFind: isItemToFind,
          )
        ]),
        resizeToAvoidBottomInset: false,
        floatingActionButton: CameraButtonFooter(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
