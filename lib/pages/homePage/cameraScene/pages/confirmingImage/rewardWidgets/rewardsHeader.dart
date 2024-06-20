import 'package:flutter/material.dart';

class RewardsHeader extends StatelessWidget {
  final int dailyStreak;
  final int totalScore;
  const RewardsHeader(
      {super.key, required this.dailyStreak, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[600]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "⭐ $dailyStreak",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          Row(
            children: <Widget>[
              const Text(
                "🔥",
                style: TextStyle(fontSize: 28),
              ),
              Text("$dailyStreak",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w600,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
