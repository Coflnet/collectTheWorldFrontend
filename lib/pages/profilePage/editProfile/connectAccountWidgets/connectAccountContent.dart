import 'dart:io';

import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/connectAccountWidgets/signinOptions/alreadySignedIn.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/connectAccountWidgets/signinOptions/appleSigninOption.dart';
import 'package:collect_the_world/pages/profilePage/editProfile/connectAccountWidgets/signinOptions/googleSigninOption.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectAccountContent extends StatefulWidget {
  const ConnectAccountContent({Key? key}) : super(key: key);

  @override
  _ConnectAccountContentState createState() => _ConnectAccountContentState();
}

class _ConnectAccountContentState extends State<ConnectAccountContent> {
  bool isIOS = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      setState(() {
        isIOS = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Connect account",
          style: TextStyle(
              color: Colors.grey[300],
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        (!ProfileRetrevial().getIsConnected)
            ? const AlreadySignedIn()
            : Column(
                children: <Widget>[
                  const SizedBox(height: 8),
                  const GoogleSigninOption(),
                  Visibility(visible: isIOS, child: const AppleSigninOption())
                ],
              )
      ],
    );
  }
}
