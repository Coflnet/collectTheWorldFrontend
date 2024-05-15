import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:haptic_feedback/haptic_feedback.dart';

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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white10.withOpacity(0.08)),
              child: IconButton(
                iconSize: 33,
                icon: const Icon(Icons.home_outlined,
                    color: Color.fromRGBO(110, 137, 164, 1)),
                onPressed: () => {
                  Haptics.vibrate(HapticsType.light),
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const HomePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                        transitionDuration: const Duration(milliseconds: 0),
                      ))
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white10.withOpacity(0.08)),
              child: IconButton(
                iconSize: 32,
                icon: const Icon(Icons.paste_rounded,
                    color: Color.fromRGBO(110, 137, 164, 1)),
                onPressed: () => {
                  Haptics.vibrate(HapticsType.light),
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const CapturePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                        transitionDuration: const Duration(milliseconds: 0),
                      ))
                },
              ),
            ),
            Container(
              width: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white10.withOpacity(0.08)),
              child: IconButton(
                iconSize: 33,
                icon: const Icon(Icons.leaderboard_outlined,
                    color: Color.fromRGBO(110, 137, 164, 1)),
                onPressed: () => {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white10.withOpacity(0.08)),
              child: IconButton(
                iconSize: 33,
                icon: const Icon(
                  Icons.more_horiz,
                  color: Color.fromRGBO(110, 137, 164, 1),
                ),
                onPressed: () => {
                  Haptics.vibrate(HapticsType.light),
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ProfilePage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return child;
                        },
                        transitionDuration: const Duration(milliseconds: 0),
                      ))
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
