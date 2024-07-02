import 'package:flutter/material.dart';

class PenaltyVariationHeader extends StatelessWidget {
  final String content;
  const PenaltyVariationHeader({super.key, this.content = "🚫Oh no!🚫"});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
    );
  }
}
