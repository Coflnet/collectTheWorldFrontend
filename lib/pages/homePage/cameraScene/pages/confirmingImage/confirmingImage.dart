import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/header/dailyStreak.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confettiWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/displayRewards.dart';
import 'package:confetti/confetti.dart';
import 'package:http/http.dart' as http;
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart'
    as authclie;
import 'package:collect_the_world/globals/globalScripts/systems/imageUploader.dart'
    as imageUploader;
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:flutter/material.dart';
import "package:collect_the_world/globals/globalScripts/globals.dart"
    as globals;
import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart'
    as dailyStreakScript;

class ConfirmingimagePage extends StatefulWidget {
  final String searchBarContent;
  final bool isDescription;
  final String description;

  const ConfirmingimagePage(
      {super.key,
      required this.searchBarContent,
      this.isDescription = false,
      this.description = ""});

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
        const Center(
          child: DisplayRewards()
        ),
        const Footer(),
      ]),
    );
  }

  void makeHttpCall() async {
    if (widget.isDescription) {
      descriptionEndpoint();
      return;
    }
    var image = await globals.image!.readAsBytes();
    var url = Uri.parse(
        "https://ctw.coflnet.com/api/images/${widget.searchBarContent}");

    var request = http.MultipartRequest("POST", url);
    var token = (await authclie.Authclient().tokenRequest())!;

    request.headers["Authorization"] = 'Bearer $token';

    request.files.add(http.MultipartFile.fromBytes(
      'image',
      image,
      filename: 'image.jpg',
    ));
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseString);
      print(jsonResponse);
      successfullReqeust();
    } else {
      print('Failed to upload image. Status code: ${response.statusCode}');
    }
  }

  void successfullReqeust() {
    confettiController.play();
    ItemToFindHandler().handleNewRemaingSkip();
    if (dailyStreakScript.lastUpdate.isAfter(DateTime.now())) {
      dailyStreakScript.streak = 0;
      dailyStreakScript.LoadDailyStreak().updateDayTimes();
    }
    dailyStreakScript.streak += 1;
    dailyStreakScript.LoadDailyStreak().updateDayTimes();
    setState(() {
      isLoading = false;
    });
  }

  void descriptionEndpoint() async {
    if (!imageUploader.imageUploader().finnishedLoading) {
      sleep(const Duration(milliseconds: 300));
      descriptionEndpoint();
    }

    var token = (await authclie.Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);

    final apiInstance = ImageApi(client);

    try {
      final result = await apiInstance.addDescription(
          imageUploader.imageUploader().objectId,
          body: widget.description);
      confettiController.play();
    } catch (e) {
      print('Exception when calling ImageApi->addDescription: $e\n');
    }
  }
}
