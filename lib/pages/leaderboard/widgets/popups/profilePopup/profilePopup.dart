import 'package:collect_the_world/pages/profilePage/profileWidget.dart';
import 'package:flutter/material.dart';

class ProfilePopup extends StatefulWidget {
  const ProfilePopup({super.key});

  @override
  ProfilePopupState createState() => ProfilePopupState();
}

class ProfilePopupState extends State<ProfilePopup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[Profilewidget()],
    );
  }
}
