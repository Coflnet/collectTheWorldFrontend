

import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileStreakInfo extends StatelessWidget {
const ProfileStreakInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
        children: [
          const Text("🔥", style: TextStyle(fontSize: 28),),
          Text("${ProfileRetrevial().getStreak()}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w600,
              ))
        ],
      );
  }
}