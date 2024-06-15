import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/widgets/NameAndPositionWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_string/random_string.dart';

class Profileimagewidget extends StatelessWidget {
  final String profileString;
  const Profileimagewidget({super.key, required this.profileString});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
            onPressed: () => {},
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                  child: RandomAvatar(profileString, width: 70, height: 70),
                ),
                Icon(Icons.settings, size: 35, color: Colors.grey[400])
              ],
            ),
          ),
          const NameAndPositionWidget(),
        ],
      ),
    );
  }
}
