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
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemCameraButton.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemSkip.dart';
import 'package:collect_the_world/pages/homePage/widgets/dailyItems.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/globalKeys.dart' as globalKeys;
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
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
    ItemToFindHandler().getCurrentItem().then((newItemName) {
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
            child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.fromLTRB(18, 14, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "🔎 Item to find",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontFamily: "PTSans",
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
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
                SkipButton(
                  itemName: itemName,
                  parentCallBack: skipConfirmed,
                  parentCallBackStarted: skipStarted,
                )
              ],
            ),
          ),
        ),
        const CameraButton()
      ],
    )));
  }

  void skipStarted() {
    setState(() {
      loaded = false;
    });
  }

  void skipConfirmed() {
    ItemToFindHandler().reduceRemaingSkips();
    ItemToFindHandler().fetchNewItem().then((newItemName) {
      setState(() {
        itemName = newItemName!;
        loaded = true;
      });
    });
  }
}
