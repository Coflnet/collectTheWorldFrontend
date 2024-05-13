import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileimagewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.orangeAccent),
            child: Container(
                margin: EdgeInsets.all(8),
                child: const Icon(
                  Icons.person,
                  color: Colors.white70,
                  size: 30,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                const Text(
                  "Tentamens",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Container(
                  height: 2,
                  width: 80,
                  color: Colors.white30,
                  
                ),
                const Row(
                  children: [
                    Icon(Icons.leaderboard_outlined, color: Colors.blueAccent, size: 18,),
                    Text(" 69th",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
