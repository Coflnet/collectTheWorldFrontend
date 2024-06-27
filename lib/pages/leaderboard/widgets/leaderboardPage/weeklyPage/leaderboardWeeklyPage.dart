import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/weeklyPage/leaderboardWeeklyContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LeaderboardWeeklyPage extends StatelessWidget {
  const LeaderboardWeeklyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        LeaderboardWeeklyPageContent(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[LeaderboardWeeklyJumpTo()],
        )
      ],
    );
  }
}

class LeaderboardWeeklyJumpTo extends StatefulWidget {
  const LeaderboardWeeklyJumpTo({super.key});

  @override
  LeaderboardDailyJumpToState createState() => LeaderboardDailyJumpToState();
}

class LeaderboardDailyJumpToState extends State<LeaderboardWeeklyJumpTo> {
  bool clickState = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 90),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(112, 48, 172, 1),
          borderRadius: BorderRadius.circular(80)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          clickState
              ? const LeaderboardDailyJumpToContent(type: true)
              : LoadingAnimationWidget.inkDrop(
                  color: Colors.white, size: 37)
        ],
      ),
    );
  }
}

class LeaderboardDailyJumpToContent extends StatelessWidget {
  final bool type;
  const LeaderboardDailyJumpToContent({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return type
        ? const Text(
            "69th",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        : Icon(
            Icons.arrow_upward_rounded,
            color: Colors.pink[50],
            size: 40,
          );
  }
}
