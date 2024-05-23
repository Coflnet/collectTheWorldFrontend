import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:collect_the_world/globals/globalWidgets/loadingWidget.dart';
import 'package:collect_the_world/pages/homePage/cameraScene/pages/cameraScene.dart';
import 'package:collect_the_world/globals/globalScripts/cameraController.dart'
    as cam;
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/homePage/contentContainer.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyItems.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalKeys.dart' as globalKeys;
import 'package:provider/provider.dart';

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
        child: AttentionWidget(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(18, 18, 0, 8),
            child: Text(
              "🔎Item to find",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontFamily: "Poppins-medium",
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      itemName,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    width: 110,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(107, 82, 165, 1),
                              Color.fromRGBO(89, 68, 139, 1)
                            ]),
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () => {},
                      child: const Text(
                        "Skip item",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.pink[50]),
                child: IconButton(
                    onPressed: () => changeToCameraScene(context),
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 50,
                    )),
              )
            ],
          ),
        )
      ],
    )));
  }

  //Provider.of<PopupNotifier>(context, listen: false).appear()
  void changeToCameraScene(context) async {
    var newcontoller = await cam.initCamera();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  controller: newcontoller!,
                  dailyWeeklyItem: true,
                  isItemToFind: true,
                )));
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
    var newcontoller = await cam.initCamera();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CameraScreen(
                  controller: newcontoller!,
                  dailyWeeklyItem: true,
                )));
  }
}
