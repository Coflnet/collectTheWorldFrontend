import 'dart:ui';

import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:collect_the_world/pages/homePage/collectPage/slidingWigetBox.dart';

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
    return baseWidget(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Text(
                widget.widgetName,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.95),
                  fontSize: widget.textSize,
                ),
              ),
              
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
