import 'dart:math';

import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/cachingScripts/challengeCaching.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/pages/leaderboard/scripts/leaderboardHandler.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/leaderboardPage/dailyPage/leaderboardDailyContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LeaderboardDailyPage extends StatefulWidget {
  const LeaderboardDailyPage({super.key});

  @override
  LeaderboardDailyPageState createState() => LeaderboardDailyPageState();
}

class LeaderboardDailyPageState extends State<LeaderboardDailyPage> {
  @override
  void initState() {
    super.initState();
    testApi();
  }

  void testApi() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = StatsApi(client);
    final result =
        await apiInstance.getUserStats("847e326b-c39b-484e-9621-c46962d04c04");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        LeaderboardDailyContent(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[LeaderboardDailyJumpTo()],
        )
      ],
    );
  }
}

class LeaderboardDailyJumpTo extends StatefulWidget {
  const LeaderboardDailyJumpTo({Key? key}) : super(key: key);

  @override
  LeaderboardDailyJumpToState createState() => LeaderboardDailyJumpToState();
}

class LeaderboardDailyJumpToState extends State<LeaderboardDailyJumpTo> {
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
            "",
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        : Icon(
            Icons.arrow_upward_rounded,
            color: Colors.pink[50],
            size: 40,
          );
  }
}
