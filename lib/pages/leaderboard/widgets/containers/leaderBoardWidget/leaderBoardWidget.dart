import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBPositionWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBprofilePicture.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBuserNameWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/containers/leaderBoardWidget/LBxpWidget.dart';
import 'package:collect_the_world/pages/leaderboard/widgets/popups/profilePopup/profilePopup.dart';
import 'package:collect_the_world/pages/profilePage/profileWidget.dart';
import 'package:flutter/material.dart';
import 'package:collect_the_world/globals/extentions/extentions.dart';

class LeaderBoardWidget extends StatefulWidget {
  final String name;
  final int xp;
  final int index;
  const LeaderBoardWidget(
      {super.key, required this.name, this.xp = 25, required this.index});

  @override
  LeaderBoardWidgetState createState() => LeaderBoardWidgetState();
}

class LeaderBoardWidgetState extends State<LeaderBoardWidget>
    with SingleTickerProviderStateMixin {
  bool isPopup = false;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -0.5),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        surfaceTintColor: Colors.transparent,
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
      ),
      onPressed: () {
        setState(() {
          if (isPopup) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          isPopup = !isPopup;
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              LBPositionWidget(index: widget.index),
              const TmpProfile(),
              LBuserNameWidget(name: widget.name),
              LBxpWidget(xp: widget.xp),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isPopup
                ? SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const ProfileWidget()),
                  )
                : const SizedBox.shrink(),
          ),
          Container(
            margin: EdgeInsets.only(top: isPopup ? 18 : 28),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(98, 99, 112, 0.356),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            width: 380,
            height: 2,
          ),
        ],
      ),
    );
  }
}
