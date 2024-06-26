import 'package:flutter/material.dart';

class LeaderboardActualStatsWidget extends StatelessWidget {
  final int totalPic;
  final int totalXp;
  final int totalUnique;
  final int totalTopTen;

  const LeaderboardActualStatsWidget(
      {super.key,
      required this.totalPic,
      required this.totalXp,
      required this.totalUnique,
      required this.totalTopTen});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: "Rukik-Light"),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("⭐ $totalXp XP"),
              const SizedBox(height: 8),
              Text("📷 Unique $totalUnique"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("📸 Total $totalPic"),
              const SizedBox(height: 8),
              Text("🏆 Top ten $totalTopTen")
            ],
          )
        ],
      ),
    );

  }
}
