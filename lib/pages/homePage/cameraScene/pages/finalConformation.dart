import 'dart:ui';

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/background/backgroundImage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/createDescription.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FinalConformationScene extends StatelessWidget {
  final String itemName;
  final bool isDailyWeekly;
  const FinalConformationScene(
      {super.key, required this.itemName, this.isDailyWeekly = false});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundGradiant(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    CreateDescription(
                      searchBarContent: itemName,
                    )
                  ],
                ),
                const Center(
                    child: ImageWidget(
                  sideMargin: 65,
                )),
                ItemNameLabel(
                  itemName: itemName,
                ),
                ConfirmButton(
                  searchBarContent: itemName,
                  isHttpRequest: true,
                  isDailyWeekly: isDailyWeekly,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(12, 38, 0, 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(61, 49, 102, 1),
                  borderRadius: BorderRadius.circular(120)),
              child: Icon(
                Icons.arrow_back_rounded,
                color: HexColor("#F7B0FF"),
                size: 40,
              ),
            )));
  }
}

class ItemNameLabel extends StatelessWidget {
  final String itemName;

  const ItemNameLabel({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "This is a \n $itemName?",
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
    );
  }
}
