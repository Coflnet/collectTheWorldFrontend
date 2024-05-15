import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XpWidget extends StatefulWidget {
  @override
  XpWidgetState createState() => XpWidgetState();
}

class XpWidgetState extends State<XpWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "⭐ 69",
          textScaler: TextScaler.linear(2),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
