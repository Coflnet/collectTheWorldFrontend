import 'package:collect_the_world/globals/globalScripts/systems/dailyStreak.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:collect_the_world/pages/profilePage/widgets/NameAndPositionWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileImageWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/profileStats/profileStats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  int streak = 0;
  String profileString = "helloworld";
  @override
  void initState() {
    super.initState();
  }

  void loadData() async {
    String stringProfile = await ProfilePicture().getProfileString();
    setState(() {
      profileString = stringProfile;
      streak = LoadDailyStreak().getStreak();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: baseWidget(
          child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(24, 20, 24, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Profileimagewidget(
                      profileString: profileString,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.local_fire_department_outlined,
                          color: Colors.orangeAccent,
                          size: 35,
                        ),
                        Text(
                          "$streak",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ],
                ),
                Profilestats()
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                size: 40,
                color: HexColor("aaa9ad"),
              )),
        ],
      )),
    );
  }
}
