import 'package:flutter/material.dart';

class LeaderboardDivider extends StatelessWidget {
  const LeaderboardDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 2,
      decoration: BoxDecoration(
          color: Colors.grey[600], borderRadius: BorderRadius.circular(8)),
    );
  }
}
