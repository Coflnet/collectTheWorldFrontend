import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/attentionWidget/attentionWidget.dart';
import 'package:collect_the_world/globals/globalWidgets/header/header.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemCameraButton.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/collectItemSkip.dart';
import 'package:collect_the_world/pages/homePage/widgets/collectItemWidget/noRemainingSkips.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class CollectItemWidget extends StatefulWidget {
  final double constaints;
  const CollectItemWidget({
    super.key,
    required this.constaints,
  });
  @override
  CollectItemWidgetState createState() => CollectItemWidgetState();
}

class CollectItemWidgetState extends State<CollectItemWidget> {
  String itemName = ItemToFindHandler().returnCurrentItem();
  int remainingSkips = ItemToFindHandler().returnRamaingSkips();
  bool loaded = ItemToFindHandler().returnCurrentItem() != "";

  @override
  void initState() {
    super.initState();
    loadItem();
  }

  void loadItem() async {
    String? newitem = await ItemToFindHandler().getCurrentItem();
    setState(() {
      remainingSkips = ItemToFindHandler().returnRamaingSkips();
      loaded = true;
      itemName = newitem ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (widget.constaints / 4).clamp(100, 400),
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
                  (remainingSkips <= 0)
                      ? const NoRemainingSkips()
                      : CollectItemSkip(
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
      )),
    );
  }

  void skipStarted() {
    setState(() {
      loaded = false;
    });
  }

  Future<void> skipConfirmed() async {
    ItemToFindHandler().reduceRemaingSkips();
    String? newItemName = await ItemToFindHandler().fetchNewItem();
    setState(() {
      remainingSkips = ItemToFindHandler().returnRamaingSkips();
      itemName = newItemName!;
      loaded = true;
    });
    Provider.of<SkipChangeNotifier>(context, listen: false).appear();
  }
}
