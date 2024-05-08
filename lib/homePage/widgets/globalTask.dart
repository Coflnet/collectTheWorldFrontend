import 'package:collect_the_world/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';

class GlobalTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        child: const baseWidget(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("🌎 Global Quest",
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(color: Colors.white)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
