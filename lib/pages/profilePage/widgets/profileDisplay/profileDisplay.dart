import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/widgets/profileDisplay/profileDisplayImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileDisplay extends StatelessWidget {
  const ProfileDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ProfileDisplayImage(),
            Container(
              height: 20,
              color: HexColor("#151F33"),
            )
          ],
        )
      ],
    );
  }
}
