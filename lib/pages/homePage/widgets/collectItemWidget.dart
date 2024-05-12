import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/globalScripts/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/globals/globalScripts/cameraController.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/contentContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CollectItemWidget extends StatefulWidget {
  @override
  CollectItemWidgetState createState() => CollectItemWidgetState();
}

class CollectItemWidgetState extends State<CollectItemWidget> {
  String itemName = "";
  bool loaded = false;

  void initState() {
    super.initState();
    itemDetails().getCurrentItem().then((newItemName) {
      setState(() {
        loaded = true;
        itemName = newItemName!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: baseWidget(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("🔎 Item to find",
                  textScaler: const TextScaler.linear(2.5),
                  style: TextStyle(color: Colors.white.withOpacity(0.9))),
            ],
          ),
          Expanded(
            child: Center(
                child: loaded
                    ? Container(
                        margin: const EdgeInsets.all(20),
                        child: AutoSizeText(
                          maxLines: 1,
                          "$itemName",
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white.withOpacity(0.9)),
                        ))
                    : const Loadingwidget(isVisible: true)),
          ),
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1.8)),
                  child: IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        color: Color.fromRGBO(124, 154, 184, 1),
                        size: 40,
                      )),
                ),
                const Row(
                  children: [
                    Text(
                      "+ 200",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      " XP",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white24, width: 1.8)),
                    child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Color.fromRGBO(126, 156, 187, 1),
                          size: 40,
                        ))),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => changeToCameraScene(context),
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: Color.fromRGBO(126, 156, 187, 1),
          size: 40,
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