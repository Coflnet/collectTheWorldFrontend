import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameAndPositionWidget extends StatelessWidget {
  const NameAndPositionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 20, 5),
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Anonymous",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            height: 2,
            width: 80,
            color: Colors.white30,
          ),
          const Row(
            children: [
              Icon(
                Icons.leaderboard_outlined,
                color: Colors.blueAccent,
                size: 21,
              ),
              Text(" 69th",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}
