import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XpWidget extends StatefulWidget {
  final int xp;
  const XpWidget({super.key, required this.xp});

  @override
  XpWidgetState createState() => XpWidgetState();
}

class XpWidgetState extends State<XpWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("⭐ ${widget.xp}",
            textScaler: const TextScaler.linear(2),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
