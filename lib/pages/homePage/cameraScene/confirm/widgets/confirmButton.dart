import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/confirmingImage/confirmingImage.dart';
import 'package:collect_the_world/globals/globalScripts/globals.dart'
    as globals;
import 'dart:convert';
import 'dart:ui';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/finalConformation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

String url = "http://10.0.0.19:6969";

class ConfirmButton extends StatelessWidget {
  final String searchBarContent;
  final bool isHttpRequest;
  final bool isItemToFind;
  final bool isDescription;

  const ConfirmButton(
      {super.key,
      required this.searchBarContent,
      required this.isHttpRequest,
      this.isItemToFind = false,
      this.isDescription = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 7),
        child: Container(
          
          width: 83,
          height: 83,
          decoration: BoxDecoration(
            color: Color.fromRGBO(99, 40, 154, 1),
            borderRadius: BorderRadius.circular(28),
          ),
          child: IconButton(
              onPressed: () => {handleButtonPress(context)},
              icon: Icon(
                Icons.check_rounded,
                color: HexColor("#E9BDFF"),
                size: 50,
              )),
        ));
  }

  void handleButtonPress(context) async {
    if (isItemToFind) {
      ItemToFindHandler().getNewItem();
    }

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
            builder: (context) => ConfirmingimagePage(
                  searchBarContent: searchBarContent,
                )));
    return;
  }
}
