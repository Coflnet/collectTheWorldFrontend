import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confettiWidget.dart';
import 'package:confetti/confetti.dart';
import 'package:http/http.dart' as http;
import 'package:collect_the_world/globals/globalScripts/cameraController.dart'
    as cam;
import 'package:collect_the_world/globals/globalScripts/authClient.dart'
    as authclie;
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:collect_the_world/globals/globalScripts/globals.dart"
    as globals;
import 'package:collect_the_world/globals/globalScripts/dailyStreak.dart'
    as dailyStreakScript;

class ConfirmingimagePage extends StatefulWidget {
  final String searchBarContent;

  const ConfirmingimagePage({super.key, required this.searchBarContent});

  @override
  ConfirmingimagePageState createState() => ConfirmingimagePageState();
}

class ConfirmingimagePageState extends State<ConfirmingimagePage> {
  bool isLoading = true;
  late ConfettiController confettiController;
  String xpGain = "XP +50";

  @override
  void initState() {
    super.initState();
    makeHttpCall();

    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundGradiant(),
        Center(
          child: Loadingwidget(isVisible: isLoading),
        ),
        Center(
          child: CustomConfettiWidget(confettiController: confettiController),
        ),
        Center(
          child: Visibility(
            visible: isLoading,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("XP Gained    ",
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(color: Colors.white)),
                  Text(xpGain,
                      textScaler: const TextScaler.linear(3),
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Times found    ",
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(color: Colors.white)),
                  Text(xpGain,
                      textScaler: const TextScaler.linear(3),
                      style: const TextStyle(color: Colors.white)),
                ],
              )
            ],
          )),
        ),
        const Footer(),
      ]),
    );
  }

  void makeHttpCall() async {
    var image = await globals.image!.readAsBytes();
    var url = Uri.parse("https://ctw.coflnet.com/api/images/apple");

    var request = http.MultipartRequest("POST", url);
    var token = (await authclie.Authclient().tokenRequest())!;
    print(token);
    request.headers["Authorization"] = 'Bearer $token';

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      image,
      filename: 'image.jpg',
    ));
    var response = await request.send();

    if (response.statusCode == 200) {
      print("Successfull upload of image!");
      confettiController.play();
      if (dailyStreakScript.lastUpdate.isAfter(DateTime.now())) {
        dailyStreakScript.streak = 0;
        dailyStreakScript.LoadDailyStreak().updateDayTimes();
      }
      dailyStreakScript.streak += 1;
      dailyStreakScript.LoadDailyStreak().updateDayTimes();
      setState(() {
        isLoading = false;
      });
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
    }
  }
}
