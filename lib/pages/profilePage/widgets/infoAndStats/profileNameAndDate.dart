import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileNameAndDate extends StatelessWidget {
  const ProfileNameAndDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            ProfileRetrevial().getUsername().capitalize(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          const SizedBox(height: 5),
          Text(
            "Joined ${returnMonthYear(ProfileRetrevial().getJoinDate())}",
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  String returnMonthYear(DateTime date) {
    String month = DateFormat.MMMM().format(date);
    return "$month ${date.year}";
  }
}
