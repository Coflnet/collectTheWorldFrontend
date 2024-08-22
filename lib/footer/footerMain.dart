import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/capturePage.dart';
import 'package:collect_the_world/pages/leaderboard/LeaderboardMain.dart';
import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hexcolor/hexcolor.dart';

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
              icon: Icon(Icons.home_outlined,
                  color: HexColor("5559CE")),
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
              icon: Icon(Icons.paste_rounded,
                color: HexColor("5559CE")),
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
              icon: Icon(Icons.leaderboard_outlined,
                  color: HexColor("5559CE")),
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
              icon:  Icon(
                Icons.person_outline,
                color: HexColor("5559CE"),
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
