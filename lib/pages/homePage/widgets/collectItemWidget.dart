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
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
            margin: const EdgeInsets.fromLTRB(24, 18, 0, 8),
            child: Text(
              "🔎 Item to find",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontFamily: "PTSans",
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            )),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: loaded
                          ? AutoSizeText(
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              itemName,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )
                          : LoadingAnimationWidget.inkDrop(
                              color: Colors.white, size: 45),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SkipButton(
                          parentCallBack: skipConfirmed,
                          parentCallBackStarted: skipStarted,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const CameraButton()
            ],
          ),
        )
      ],
    )));
  }

  void skipStarted() {
    setState(() {
      loaded = false;
    });
  }

  void skipConfirmed() {
    itemDetails().fetchNewItem().then((newItemName) {
      setState(() {
        itemName = newItemName!;
        loaded = true;
      });
    });
  }
}

class SkipButton extends StatelessWidget {
  final VoidCallback parentCallBack;
  final VoidCallback parentCallBackStarted;
  const SkipButton(
      {super.key,
      required this.parentCallBack,
      required this.parentCallBackStarted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 16, 0, 8),
      width: 110,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(100, 80, 160, 1),
                Color.fromRGBO(89, 68, 139, 1)
              ]),
          borderRadius: BorderRadius.circular(16)),
      child: TextButton(
        onPressed: () => {
          Provider.of<PopupNotifier>(context, listen: false)
              .appear(skipConfirmed, parentCallBackStarted)
        },
        child: const Text(
          "Skip item",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              fontFamily: "Fredoka-SemiExpanded"),
        ),
      ),
    );
  }

  void skipConfirmed() {
    parentCallBack();
  }
}

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.pink[50]),
            child: IconButton(
                onPressed: () => changeToCameraScene(context),
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                  color: Colors.black.withOpacity(0.8),
                )),
          ),
        ],
      ),
    );
  }

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
