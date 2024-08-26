import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:random_avatar/random_avatar.dart';

class ProfileDisplayImage extends StatelessWidget {
  const ProfileDisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return (ProfileRetrevial().getProfileString() == "ohno")
        ? TextButton(
            onPressed: () => {changeScene(context)},
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 250,
                      child: Image(
                          image: AssetImage("assets/images/addPicture.png"))),
                ],
              ),
            ))
        : Container(
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

  void changeScene(context) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const EditProfileMain(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
          transitionDuration: const Duration(milliseconds: 0),
        ));
  }
}
