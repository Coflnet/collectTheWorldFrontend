import 'package:flutter/material.dart';

class ProfileStatsWidget extends StatefulWidget {
  const ProfileStatsWidget({Key? key}) : super(key: key);

  @override
  _ProfileStatsWidgetState createState() => _ProfileStatsWidgetState();
}

class _ProfileStatsWidgetState extends State<ProfileStatsWidget> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTextStyle(
      style: TextStyle(
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
              Text("⭐ 420 XP"),
              SizedBox(height: 8),
              Text("📷 Unique 69"),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("📸 Total 69"),
              SizedBox(height: 8),
              Text("🏆 Top ten 10")
            ],
          )
        ],
      ),
    );
  }
}
