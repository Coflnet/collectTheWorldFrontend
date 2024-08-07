import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/capturePage.dart';
import 'package:collect_the_world/pages/leaderboard/LeaderboardMain.dart';
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
        height: 76,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(21, 31, 51, 1),
            border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.6), width: 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 45,
              icon: const Icon(Icons.home_outlined,
                  color: Color.fromRGBO(80, 173, 255, 1)),
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
            IconButton(
              iconSize: 40,
              icon: const Icon(Icons.paste_rounded,
                color: Color.fromRGBO(0, 145, 255, 1)),
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
            Container(
              width: 50,
            ),
            IconButton(
              iconSize: 45,
              icon: const Icon(Icons.leaderboard_outlined,
                  color: Color.fromRGBO(0, 145, 255, 1)),
              onPressed: () => {
                Haptics.vibrate(HapticsType.light),
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const LeaderboardMain(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      transitionDuration: const Duration(milliseconds: 0),
                    ))
              },
            ),
            IconButton(
              iconSize: 50,
              icon: const Icon(
                Icons.person_outline,
                color: Color.fromRGBO(0, 145, 255, 1),
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
            )
          ],
        ),
      ),
    );
  }
}
