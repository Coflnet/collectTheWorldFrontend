import 'dart:ui';

import 'package:collect_the_world/globals/globalScripts/cachingScripts/multiplierCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/popups/conformationPopup/conformationPopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

typedef FutureCallback = Future<void> Function();

class CollectItemSkip extends StatefulWidget {
  final FutureCallback parentCallBack;
  final VoidCallback parentCallBackStarted;
  final String itemName;
  const CollectItemSkip(
      {super.key,
      required this.parentCallBack,
      required this.parentCallBackStarted,
      required this.itemName});

  @override
  _CollectItemSkipState createState() => _CollectItemSkipState();
}

class _CollectItemSkipState extends State<CollectItemSkip> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 4, 8),
      width: 110,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                HexColor("#6430FF"),
                HexColor("#6430FF"),
              ]),
          borderRadius: BorderRadius.circular(16)),
      child: Container(
        child: loading
            ? Container(
                padding: const EdgeInsets.all(8),
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.white, size: 35))
            : TextButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  await ItemToFindHandler().skipItem(widget.itemName);
                  skipConfirmed();
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
      ),
    );
  }

  void skipConfirmed() async {
    await widget.parentCallBack();
    setState(() {
      loading = !loading;
    });
  }
}
