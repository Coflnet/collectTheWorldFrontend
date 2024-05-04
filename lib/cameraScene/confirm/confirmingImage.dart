import 'dart:convert';
import 'dart:ffi';
import 'dart:isolate';

import 'package:collect_the_world/cameraScene/confirm/widgets/confettiWidget.dart';
import 'package:confetti/confetti.dart';
import 'package:http/http.dart' as http;
import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/footer/footerMain.dart';
import 'package:collect_the_world/globalWidgets/loadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:collect_the_world/globals.dart" as globals;

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
        ConfettiController(duration: Duration(milliseconds: 50));
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
    super.initState();
    var image = await globals.image!.readAsBytes();
    var image64 = base64Encode(image);

    var dataToSend = {"image": image64, 'name': widget.searchBarContent};
    String jsonDataToSend = jsonEncode(dataToSend);
    final response = await http.post(
        Uri.parse("http://10.0.0.19:8080/api/ctw/proccess"),
        headers: {'Content-Type': 'application/json'},
        body: jsonDataToSend);
    if (response.statusCode == 200) {
      confettiController.play();
      setState(() {
        isLoading = false;
      });
    }
  }
}
