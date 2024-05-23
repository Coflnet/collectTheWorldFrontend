import 'package:collect_the_world/main.dart';
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
        margin: EdgeInsets.only(left: 2),
        height: 70,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(39, 48, 59, 1),
            border: Border(top: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              iconSize: 45,
              icon: const Icon(Icons.home_outlined,
                  color: Color.fromRGBO(138, 172, 206, 1)),
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
            Container(
              width: 50,
            ),
            IconButton(
              iconSize: 45,
              icon: const Icon(Icons.leaderboard_outlined,
                  color: Color.fromRGBO(110, 137, 164, 1)),
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
            )
          ],
        ),
      ),
    );
  }
}
