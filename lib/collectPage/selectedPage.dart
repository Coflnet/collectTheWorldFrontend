import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:collect_the_world/collectPage/slidingWidgets.dart';

class Selectedpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

          ],
        ),
        Expanded(child: SlidingWidgets()),
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
      child: Text(
        widget.text, // Accessing text from the widget
        style: TextStyle(
          fontSize: 20, // Adjust the font size as needed
          color: Colors.white70,
        ),
      ),
    );
  }
}
