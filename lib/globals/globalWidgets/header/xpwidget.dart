import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
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
    return CustomPopupMenu(
      pressType: PressType.singleClick,
      barrierColor: Colors.transparent,
      menuBuilder: () => ClipRRect(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(151, 129, 234, 1),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            textAlign: TextAlign.center,
            "Literally just\nyour XP",
            style: TextStyle(
                color: Colors.grey[200],
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      child: Row(
        children: [
          Text("⭐ ${widget.xp}",
              textScaler: const TextScaler.linear(2),
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}
