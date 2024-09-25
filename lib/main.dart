import 'dart:ffi';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/challengeCaching.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/listCaching.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalScripts/systems/runNotifications.dart';
import 'package:collect_the_world/globals/globalScripts/systems/serverSideData/serverSideData.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmScene.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/collectPage/widgets/idkWhatToCallThis/itemSlidingPageHeader.dart';
import 'package:collect_the_world/pages/homePage/contentContainer.dart';
import 'package:collect_the_world/pages/homePage/loadingPages/appStartupLoading.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/onboarding/onboardingMain.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/InfoPopupMain.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/pages/homePage/collectPage/itemSlidingPage.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/globals/globalKeys.dart' as globalKeys;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color.fromRGBO(21, 31, 51, 1),
  ));
  runApp(const AppStartupLoading());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int dailyStreakNum = ProfileRetrevial().getStreak();
  int dailyQuestCompletion = dailyChallenge[0].progress ?? 0;
  List<ActiveMultiplier> multiplierList = MultiplierCaching().getMultiplier();
  int xp = 0;
  bool popupVisible = false;
  int variation = 1;

  bool floatingVisible = true;

  @override
  initState() {
    super.initState();

    loadData();
  }

  void loadpopup() {}

  void loadData() async {
    loadImportantData();
    loadChallenge();
    LoadingProfileInfo().loadLeaderboardProfile();
    loadXP();
    handleLegalConfirming();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void handleLegalConfirming() {
    if (!LegalChangeUploader().getAlreadyAgreed) {
      setState(() {
        floatingVisible = false;
        popupVisible = true;
        variation = 3;
      });
    }
  }

  void loadXP() async {
    await LoadingProfileInfo().loadStatsFromCloud();
    ItemToFindHandler().setRemainingSkips(ProfileRetrevial().getSkips());
    ItemToFindHandler().saveData();

    setState(() {
      dailyStreakNum = ProfileRetrevial().getStreak();
      xp = ProfileRetrevial().getTotalXp();
    });
  }

  void loadChallenge() async {
    List<Challenge> dailyChallenge =
        await ChallengeCaching().getDailyChallenge();
    setState(() {
      dailyQuestCompletion = dailyChallenge[0].progress!;
    });
  }

  Future<void> loadImportantData() async {
    await MultiplierCaching().loadMultiplier();
    setState(() {
      multiplierList = MultiplierCaching().getMultiplier();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PopupNotifier()),
            ChangeNotifierProvider(create: (context) => SkipChangeNotifier())
          ],
          child: Stack(children: [
            const BackgroundGradiant(),
            CustomHeader(dailStreakNum: dailyStreakNum, xp: xp),
            const ConformationPopup(),
            ContentContainer(
              multiplierList: multiplierList,
              collectionPercentage: dailyQuestCompletion,
            ),
            const Footer(),
            Center(
                child: InfoPopupMain(
              visFlip: flipPopupVisible,
              variation: variation,
              visible: popupVisible,
              flip: flipFloatingVisible,
            )),
            const RunNotifications()
          ]),
        ),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
        floatingActionButton: Visibility(
            visible: floatingVisible, child: const CameraButtonFooter()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  void flipPopupVisible() {
    setState(() {
      popupVisible = !popupVisible;
    });
  }

  void flipFloatingVisible() {
    setState(() {
      floatingVisible = !floatingVisible;
    });
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
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Stack(children: [
          const BackgroundGradiant(),
          ConfirmSceneMain(
            isItemToFind: isItemToFind,
          )
        ]),
        backgroundColor: const Color.fromRGBO(34, 40, 49, 1),
      ),
    );
  }
}
