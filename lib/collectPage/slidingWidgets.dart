import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';
import 'package:collect_the_world/collectPage/slidingWigetBox.dart';

typedef void updateCurrentSelection(int currentSelection);

class SlidingWidgets extends StatefulWidget {
  final String widgetName;
  final String endPoint;
  final bool isVisibleVal;
  final double marginVal;
  final double iconSizeVal;

  const SlidingWidgets(
      {super.key,
      required this.widgetName,
      required this.endPoint,
      this.iconSizeVal = 30,
      this.marginVal = 10,
      this.isVisibleVal = true});

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
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: Colors.white10),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.05),
      ),
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
                  fontSize: 30,
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
