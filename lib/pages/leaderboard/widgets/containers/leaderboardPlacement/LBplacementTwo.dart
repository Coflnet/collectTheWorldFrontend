import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:flutter/material.dart';

class LBplacementTwo extends StatelessWidget {
  final List userInfo;
  const LBplacementTwo({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8,4,8,4),

              width: double.infinity,
              padding: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(color: Colors.grey[400]),
              child: const PlacementContent(),
            ),
          )
        ],
      ),
    );
  }
}

class PlacementContent extends StatelessWidget {
  const PlacementContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const TmpProfile(),
        const Text(
          "Tentamens",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        Text(
          "2",
          style: TextStyle(color: Colors.yellow[50], fontSize: 36),
        )
      ],
    );
  }
}
