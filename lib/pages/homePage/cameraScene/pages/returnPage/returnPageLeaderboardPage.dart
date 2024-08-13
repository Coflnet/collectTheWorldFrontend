import 'package:collect_the_world/generatedCode/api.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderBoardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ReturnPageLeaderboardPage extends StatefulWidget {
  final String whichOne;
  const ReturnPageLeaderboardPage({super.key, required this.whichOne});

  @override
  _ReturnPageLeaderboardPageState createState() =>
      _ReturnPageLeaderboardPageState();
}

class _ReturnPageLeaderboardPageState extends State<ReturnPageLeaderboardPage> {
  List content = [];

  @override
  void initState() {
    super.initState();
    loadLeaderBoard();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: content.length,
      itemBuilder: (context, index) {
        return content.isEmpty
            ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 30)
            : LeaderBoardWidget(
                name: content[index][0],
                xp: content[index][1],
                index: index,
                profileImage: content[index][3] ?? "",
                userId: content[index][2] ?? "",
              );
      },
    );
  }

  void loadLeaderBoard() async {
    token = (await Authclient().tokenRequest())!;
    var authclient = HttpBearerAuth();
    authclient.accessToken = token;
    final client = ApiClient(
        basePath: "https://ctw.coflnet.com", authentication: authclient);
    final apiInstance = LeaderboardApi(client);
    try {
      final result = await apiInstance.getLeaderboardAroundMe(widget.whichOne);
      if (result == null) {
        return;
      }
      List returnList = [];

      for (var i in result) {
        String username = "";
        username = i.user?.name as String;
        if (i.user?.name == null) {
          username = "Anonymous";
        }
        returnList.add([username, i.score, i.user?.userId, i.user?.avatar]);
      }
      setState(() {
        content = returnList;
      });
    } catch (e) {
      print("error fetching leaderboard data return page $e");
    }
  }
}
