import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:flutter/material.dart';

class LBuserNameWidget extends StatelessWidget {
  final String name;
  const LBuserNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text(
          name.capitalize(),
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 243, 247),
              fontSize: 18,
              fontWeight: FontWeight.w700),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
