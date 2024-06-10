import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:collect_the_world/pages/profilePage/widgets/NameAndPositionWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileImageWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/profileStats/profileStats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profilewidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: baseWidget(
          child: Container(
        margin: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Profileimagewidget(),
                const Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: Colors.orangeAccent,
                      size: 35,
                    ),
                    Text(
                      "69",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
            Profilestats()
          ],
        ),
      )),
    );
  }
}
