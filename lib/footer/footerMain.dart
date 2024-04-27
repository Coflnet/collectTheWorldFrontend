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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                iconSize: 33,
                icon: const Icon(Icons.home_outlined,
                    color: Color.fromRGBO(110, 137, 164, 1)),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const homePage()))
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(118, 221, 221, 221),
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                iconSize: 32,
                icon: const Icon(Icons.paste_rounded,
                    color: Color.fromRGBO(110, 137, 164, 1)),
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CapturePage()))
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
                  borderRadius: BorderRadius.circular(15)),
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
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                iconSize: 33,
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Color.fromRGBO(110, 137, 164, 1),
                ),
                onPressed: () => {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
