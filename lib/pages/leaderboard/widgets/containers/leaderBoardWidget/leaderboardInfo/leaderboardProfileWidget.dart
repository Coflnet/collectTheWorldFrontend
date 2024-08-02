import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/leaderboardInfo/leaderboardProfileStats.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileImageWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileStats/profileStats.dart';
import 'package:flutter/material.dart';

class LeaderboardProfileWidget extends StatefulWidget {
  final String profileImage;
  final String userid;
  final String username;

  const LeaderboardProfileWidget({super.key, required this.profileImage, required this.userid, required this.username});

  @override
  _LeaderboardProfileWidgetState createState() =>
      _LeaderboardProfileWidgetState();
}

class _LeaderboardProfileWidgetState extends State<LeaderboardProfileWidget> {
  int streak = 0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: baseWidget(
          child: Container(
        margin: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Profileimagewidget(
                  profileString: widget.profileImage,
                  username: widget.username,
                ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.local_fire_department_outlined,
                //       color: Colors.orangeAccent,
                //       size: 35,
                //     ),
                //     Text(
                //       "$streak",
                //       style: const TextStyle(color: Colors.white, fontSize: 25),
                //     )
                //   ],
                // ),
              ],
            ),
            LeaderboardProfileStats(profileID: widget.userid)
          ],
        ),
      )),
    );
  }
}
