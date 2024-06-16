import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileDisplayImage extends StatelessWidget {
  const ProfileDisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(color: HexColor("#393A55")),
        height: MediaQuery.sizeOf(context).height * 0.35,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: RandomAvatar(
            ProfileRetrevial().getProfileString(),
            trBackground: true,
            height: 250,
            width: 250,
          ),
        ));
  }
}
