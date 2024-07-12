import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmingImageXp extends StatelessWidget {
  final int xp;
  const ConfirmingImageXp({super.key, required this.xp});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("⭐ $xp",
            textScaler: const TextScaler.linear(2.4),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            )),
      ],
    );
  }
}
