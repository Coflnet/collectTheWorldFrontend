import 'package:collect_the_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(45, 58, 74, 0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 33,
              icon: const Icon(Icons.home_outlined,
                  color: Color.fromRGBO(110, 137, 164, 1)),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const homePage()))
              },
            ),
            IconButton(
              padding: const EdgeInsets.only(right: 10),
              iconSize: 30,
              icon: const Icon(Icons.paste_rounded,
                  color: Color.fromRGBO(110, 137, 164, 1)),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CapturePage()))
              },
            ),
            Container(
              width: 50,
            ),
            IconButton(
              padding: const EdgeInsets.only(left: 10),
              iconSize: 33,
              icon: const Icon(Icons.leaderboard_outlined,
                  color: Color.fromRGBO(110, 137, 164, 1)),
              onPressed: () => {},
            ),
            IconButton(
              iconSize: 33,
              icon: const Icon(
                Icons.notifications_outlined,
                color: Color.fromRGBO(110, 137, 164, 1),
              ),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}

class cameraButton extends StatelessWidget {
  const cameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: new Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: 65,
          height: 65,
          decoration: new BoxDecoration(
            color: const Color.fromARGB(255, 207, 207, 207).withOpacity(0.04),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: const Color.fromARGB(43, 255, 255, 255), width: 0.7),
          ),
          child: IconButton(
            iconSize: 35,
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_rounded),
            color: const Color.fromRGBO(110, 137, 164, 1), // Icon color
          ),
        ),
      ),
    );
  }
}
