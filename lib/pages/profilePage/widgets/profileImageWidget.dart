import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/widgets/NameAndPositionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_string/random_string.dart';

class Profileimagewidget extends StatelessWidget {
  final String profileString;
  final String username;
  const Profileimagewidget(
      {super.key, required this.profileString, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
            child: RandomAvatar(profileString, width: 60, height: 60),
          ),
          NameAndPositionWidget(username: username),
        ],
      ),
    );
  }
}
