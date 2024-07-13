import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: baseWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("🌎 Global Quest",
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
              const Text(
              "🚧 In development 👷",
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Container(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
