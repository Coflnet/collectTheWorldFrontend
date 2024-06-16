import 'package:collect_the_world/pages/profilePage/widgets/profileStats/profileStatsWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linksWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profilestats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(111, 99, 150, 1),
              borderRadius: BorderRadius.circular(8)),
          child: const Column(
            children: [
              Text(
                "🎉 Achievements",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              ),
              ProfileDivider(),
              ProfileStatsWidget(),
            ],
          )),
    );
  }
}

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8, 10, 8, 16),
      width: double.infinity,
      height: 2,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(10)),
    );
  }
}
