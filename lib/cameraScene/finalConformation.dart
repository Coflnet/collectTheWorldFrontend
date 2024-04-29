import 'dart:ui';

import 'package:collect_the_world/background/backgroundImage.dart';
import 'package:collect_the_world/background/frostedGlass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class finalConformationScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          FrostedGlass(),
          Column(
            children: [],
          ),
        ],
      ),
    );
  }
}

class backButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 83,
                  height: 83,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 207, 207, 207)
                        .withOpacity(0.04),
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(
                        color: const Color.fromARGB(43, 255, 255, 255),
                        width: 0.7),
                  ),
                  child: IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons,
                        color: Colors.orange,
                        size: 60,
                      )),
                ),
              ),
            )));
  }
}
