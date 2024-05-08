import 'dart:ui';

import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/background/backgroundImage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/confirmButton.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/createDescription.dart';
import 'package:collect_the_world/cameraScene/confirm/widgets/imageWidget.dart';
import 'package:collect_the_world/footer/cameraButton.dart';
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [BackButton(), CreateDescription()],
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
      floatingActionButton: CameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              onPressed: () => {},
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.orange,
                size: 40,
              )),
        ));
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
