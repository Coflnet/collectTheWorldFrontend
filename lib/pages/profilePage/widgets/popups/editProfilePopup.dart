import 'dart:ffi';

import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/widgets/popups/closeSaveProfileButton.dart';
import 'package:collect_the_world/pages/profilePage/widgets/popups/randomizeProfilePicture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:random_string/random_string.dart';
import 'package:url_launcher/url_launcher.dart';

class EditprofileNotifer extends ChangeNotifier {
  late EditProfilePopupState _editProfilePopupState;

  void setEditprofileState(EditProfilePopupState state) {
    _editProfilePopupState = state;
  }

  void appear() {
    _editProfilePopupState.appear();
  }
}

class EditProfilePopup extends StatefulWidget {
  const EditProfilePopup({super.key});

  @override
  EditProfilePopupState createState() => EditProfilePopupState();
}

class EditProfilePopupState extends State<EditProfilePopup>
    with SingleTickerProviderStateMixin {
  bool visible = false;
  bool saveClose = true;
  String profileString = ProfilePicture().getProfileString();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<EditprofileNotifer>(context, listen: false)
        .setEditprofileState(this);

    return SafeArea(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
            child: Center(
          child: AnimatedOpacity(
            opacity: visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.85,
              height: 240,
              decoration: BoxDecoration(
                  color: HexColor("#2A5388"),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RandomAvatar(profileString, width: 75, height: 75),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  profileString = randomString(30);
                                  saveClose = false;
                                });
                              },
                              child: const RandomizeProfilePicture())
                        ],
                      ),
                    ],
                  ),
                  CloseSaveProfileButton(
                    saveClose: saveClose,
                  ),
                ],
              ),
            ),
          ),
        ))
      ],
    ));
  }

  void appear() {
    setState(() {
      visible = true;
    });
  }
}
