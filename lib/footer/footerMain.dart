import 'package:collect_the_world/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(45, 58, 74, 1),
        border: Border(
          top: BorderSide(
              width: 2.0,
              color: Color.fromRGBO(96,112,129, 1)), // Add this line for the top border
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: IconButton(
            iconSize: 33,
            icon: const Icon(Icons.home_outlined,
                color: Color.fromRGBO(110, 137, 164, 1)),
            onPressed: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const homePage()))
            },
          )),
          Expanded(
              child: IconButton(
            padding: const EdgeInsets.only(right: 10),
            iconSize: 30,
            icon: const Icon(Icons.paste_rounded,
                color: Color.fromRGBO(110, 137, 164, 1)),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CapturePage()))
            },
          )),
          Expanded(
              child: Container(
            width: 50,
          )),
          Expanded(
              child: IconButton(
            padding: const EdgeInsets.only(left: 10),
            iconSize: 33,
            icon: const Icon(Icons.leaderboard_outlined,
                color: Color.fromRGBO(110, 137, 164, 1)),
            onPressed: () => {},
          )),
          Expanded(
              child: IconButton(
            iconSize: 33,
            icon: const Icon(
              Icons.notifications_outlined,
              color: Color.fromRGBO(110, 137, 164, 1),
            ),
            onPressed: () => {},
          ))
        ],
      ),
    );
  }
}

class cameraButton extends StatelessWidget {
  const cameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4), // Shadow color
            spreadRadius: -3, // Spread radius
            blurRadius: 8, // Blur radius
            offset: const Offset(0, 10), // Offset from the top left corner
          ),
        ],
        color: const Color.fromARGB(255, 241, 241, 241), // Background color
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 30),
      child: IconButton(
        iconSize: 35,
        onPressed: () {},
        icon: const Icon(Icons.camera_alt_rounded),
        color: const Color.fromRGBO(110, 137, 164, 1), // Icon color
      ),
    );
  }
}

