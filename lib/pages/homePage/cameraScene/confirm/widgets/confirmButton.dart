import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage.dart';
import 'package:collect_the_world/globals/globalScripts/globals.dart' as globals;
import 'dart:convert';
import 'dart:ui';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/finalConformation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String url = "http://10.0.0.19:6969";

class ConfirmButton extends StatelessWidget {
  final String searchBarContent;
  final bool isHttpRequest;

  const ConfirmButton(
      {super.key, required this.searchBarContent, required this.isHttpRequest});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Container(
          width: 83,
          height: 83,
          decoration: BoxDecoration(
            color: Colors.white10,
                        borderRadius: BorderRadius.circular(70),
            border: Border.all(
                color: Colors.white12, width: 1.5),
          ),
          child: IconButton(
              onPressed: () => {handleButtonPress(context)},
              icon: const Icon(
                Icons.check_rounded,
                color: Colors.orange,
                size: 60,
              )),
        ));
  }

  void handleButtonPress(context) async {
    if (isHttpRequest) {
      makeHttpRequest(context);
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FinalConformationScene(itemName: searchBarContent)));
  }

  void makeHttpRequest(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ConfirmingimagePage(searchBarContent: searchBarContent,)));
    return;
  }
}
