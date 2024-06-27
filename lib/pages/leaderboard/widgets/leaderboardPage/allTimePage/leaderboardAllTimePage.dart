import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/allTimePage/leaderboardAllTimeContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LeaderboardAllTimePage extends StatelessWidget {
  const LeaderboardAllTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: <Widget>[
        LeaderboardAllTimeContent(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[LeaderboardAlltimeJumpTo()],
        )
      ],
    );
  }
}

class LeaderboardAlltimeJumpTo extends StatefulWidget {
  const LeaderboardAlltimeJumpTo({super.key});

  @override
  LeaderboardWeeklAlltimeoState createState() =>
      LeaderboardWeeklAlltimeoState();
}

class LeaderboardWeeklAlltimeoState extends State<LeaderboardAlltimeJumpTo> {
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
              ? const LeaderboardWeeklyJAlltimeontent(type: true)
              : LoadingAnimationWidget.inkDrop(
                  color: Colors.white, size: 37)
        ],
      ),
    );
  }
}

class LeaderboardWeeklyJAlltimeontent extends StatelessWidget {
  final bool type;
  const LeaderboardWeeklyJAlltimeontent({super.key, required this.type});

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
