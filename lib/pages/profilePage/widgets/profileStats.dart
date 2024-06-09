import 'package:collect_the_world/pages/profilePage/widgets/linksWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profilestats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "⭐ 420 XP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "📷 Unique: 69",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "📸 Total: 69",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "🏆 Top ten: 10",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}

class divider extends StatelessWidget {
  const divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 120,
      height: 3,
      decoration: BoxDecoration(
          color: Colors.white38, borderRadius: BorderRadius.circular(10)),
    );
  }
}
