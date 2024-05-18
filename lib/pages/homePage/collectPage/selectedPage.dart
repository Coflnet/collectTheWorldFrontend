import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:collect_the_world/pages/homePage/collectPage/slidingWidgets.dart';
import 'package:flutter/widgets.dart';

class Selectedpage extends StatefulWidget {
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<Selectedpage> {
  int currentSelection = 0;

  void updateCurrentSelection(int newSelection) {
    setState(() {
      currentSelection = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 3, 30, 0),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
          Expanded(
              child: SlidingWidgets(
            widgetName: "⭐ Newest",
            endPoint: "http://localhost:6969/",
            iconSizeVal: 40,
          )),
          SizedBox(height: 15),
          Expanded(
            child: Row(
              children: [

                Expanded(
                    child: SlidingWidgets(
                        widgetName: "☀️ Daily",
                        textSize: 25,
                        endPoint: "http://localhost:6969/")),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
