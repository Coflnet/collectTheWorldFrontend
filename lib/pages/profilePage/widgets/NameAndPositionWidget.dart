import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameAndPositionWidget extends StatelessWidget {
  final String username;
  const NameAndPositionWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 6, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            username.capitalize(),
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
