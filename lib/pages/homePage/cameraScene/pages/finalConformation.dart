import 'dart:ui';

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/background/backgroundImage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/createDescription.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
import 'package:collect_the_world/globals/globalScripts/cameraController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FinalConformationScene extends StatelessWidget {
  final String itemName;
  const FinalConformationScene({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundGradiant(),
          FrostedGlass(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const BackButton(), CreateDescription(searchBarContent: itemName,)],
              ),
              const Center(child: ImageWidget()),
              ItemNameLabel(
                itemName: itemName,
              ),
              ConfirmButton(
                searchBarContent: itemName,
                isHttpRequest: true,
              ),
            ],
          ),
        ],
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
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 45, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white10,
              border: Border.all(color: Colors.white12)),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.orange,
                size: 40,
              )),
        ));
  }
  void changeToCameraScene(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CameraScreen(controller: controller, dailyWeeklyItem: true)));
  }
}

class ItemNameLabel extends StatelessWidget {
  final String itemName;

  const ItemNameLabel({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        textAlign: TextAlign.center,
        "This is a \n $itemName?",
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }
}
