import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/editProfileHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class EditProfileMain extends StatefulWidget {
  const EditProfileMain({Key? key}) : super(key: key);

  @override
  _EditProfileMainState createState() => _EditProfileMainState();
}

class _EditProfileMainState extends State<EditProfileMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const EditProfileHeader(),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RandomAvatar(ProfileRetrevial().getProfileString(), width: 120)
              ],
            )
          ],
        ),
        backgroundColor: const Color.fromRGBO(21, 31, 51, 1),
      ),
    );
  }
}
