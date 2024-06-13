import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoSkipsPopup extends StatelessWidget {
  const NoSkipsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(151, 129, 234, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        "Collect any item\nto get more skips",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white70),
      ),
    );
  }
}
