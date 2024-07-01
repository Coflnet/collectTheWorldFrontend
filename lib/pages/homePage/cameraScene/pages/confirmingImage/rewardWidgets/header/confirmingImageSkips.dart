import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmingImageSkips extends StatelessWidget {
  final int remainingSkips;
  const ConfirmingImageSkips({super.key, required this.remainingSkips});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(
        "⏭️",
        style: TextStyle(fontSize: 27),
      ),
      Container(
        margin: const EdgeInsets.only(left: 8),
        child: Text(
          "$remainingSkips",
          textScaler: const TextScaler.linear(1.9),
          style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600),
        ),
      ),
    ]);
  }
}
