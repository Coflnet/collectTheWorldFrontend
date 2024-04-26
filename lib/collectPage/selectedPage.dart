import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:collect_the_world/collectPage/slidingWidgets.dart';
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SelectedPageLabels(
                text: "Daily", isSelected: currentSelection == 0),
            SelectedPageLabels(
                text: "Weekly", isSelected: currentSelection == 1),
            SelectedPageLabels(
                text: "Newest", isSelected: currentSelection == 2),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          height: 4,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 143, 143, 143)),
        ),
        Expanded(
            child: SlidingWidgets(
          onUpdate: (newID) => updateCurrentSelection(newID),
        )),
      ],
    );
  }
}

class SelectedPageLabels extends StatefulWidget {
  final String text;
  bool isSelected = false;
  SelectedPageLabels({required this.text, required this.isSelected});

  @override
  _SelectedPageLabelsState createState() => _SelectedPageLabelsState();
}

class _SelectedPageLabelsState extends State<SelectedPageLabels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 300),
        tween: ColorTween(
          begin: widget.isSelected ? Colors.white60 : Colors.white,
          end: widget.isSelected ? Colors.white : Colors.white60,
        ),
        builder: (context, color, child) {
          return Text(
            widget.text,
            style: TextStyle(
              fontSize: 30,
              color: color,
            ),
          );
        },
      ),
    );
  }
}
