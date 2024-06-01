import 'dart:ui';

import 'package:collect_the_world/globals/globalScripts/systems/itemToFindUpdater.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ConformationPopup extends StatefulWidget {
  const ConformationPopup({Key? key}) : super(key: key);

  @override
  ConformationPopupState createState() => ConformationPopupState();
}

class PopupNotifier extends ChangeNotifier {
  late ConformationPopupState _popeupState;

  void setPopupState(ConformationPopupState state) {
    _popeupState = state;
  }

  void appear(VoidCallback callback, callBackStarted) {
    _popeupState.appear(callback, callBackStarted);
  }
}

class ConformationPopupState extends State<ConformationPopup>
    with SingleTickerProviderStateMixin {
  double topPosition = -100;
  late AnimationController controller;
  VoidCallback newItemCallback = () {};
  VoidCallback callBackStarted = () {};

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this, // Animation duration
    );
    setState(() {
      topPosition = -100;
      controller.reverse();
    });
  }

  void appear(VoidCallback callback, callBackStartedRef) {
    newItemCallback = callback;
    callBackStarted = callBackStartedRef;
    setState(() {
      topPosition = 40;
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PopupNotifier>(context, listen: false).setPopupState(this);
    return AnimatedPositioned(
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 500),
      top: topPosition,
      left: 0,
      right: 0,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: baseWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          border: Border.all(color: Colors.white12),
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              topPosition = -100;
                              controller.reverse();
                            });
                          },
                          icon: const Icon(
                            Icons.do_disturb,
                            color: Colors.white,
                          ))),
                  Container(
                    child: const Text(
                      "Skip Item?",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              border: Border.all(color: Colors.white12),
                              borderRadius: BorderRadius.circular(15)),
                          child: IconButton(
                              onPressed: () async {
                                callBackStarted();
                                setState(() {
                                  topPosition = -100;
                                  controller.reverse();
                                });
                                await ItemToFindHandler().skipItemAsync();
                                newItemCallback();
                              },
                              icon: const Icon(
                                Icons.check,
                                size: 32,
                                color: Color.fromRGBO(127, 97, 194, 1),
                              ))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
