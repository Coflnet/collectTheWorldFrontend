import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:collect_the_world/collectPage/slidingWigetBox.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

typedef void updateCurrentSelection(int currentSelection);

class SlidingWidgets extends StatefulWidget {
  final String widgetName;
  final String endPoint;
  final bool isVisibleVal;
  final double marginVal;
  final double iconSizeVal;
  final double textSize;

  const SlidingWidgets(
      {super.key,
      required this.widgetName,
      required this.endPoint,
      this.iconSizeVal = 40,
      this.marginVal = 10,
      this.isVisibleVal = true,
      this.textSize = 30});

  @override
  SlidingWidgetsState createState() => SlidingWidgetsState();
}

class SlidingWidgetsState extends State<SlidingWidgets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24, width: 2),
        borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(81, 81, 112, 1),
          Color.fromRGBO(54, 56, 77, 1),
        ],
      )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 10,
              ),
              Text(
                widget.widgetName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: widget.textSize,
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.expand_rounded,
                  color: Colors.white70,
                ),
              )
            ],
          ),
          Expanded(
              child: ContainerListView(
                  isVisible: widget.isVisibleVal,
                  margin: widget.marginVal,
                  iconSize: widget.iconSizeVal)),
        ],
      ),
    );
  }
}
