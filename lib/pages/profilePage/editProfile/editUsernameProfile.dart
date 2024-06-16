import 'package:collect_the_world/globals/extentions/extentions.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/pages/profilePage/widgets/infoAndStats/profileStats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditUsernameProfile extends StatelessWidget {
  final Function(String) usernameChange;

  const EditUsernameProfile({super.key, required this.usernameChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        Container(
          margin: EdgeInsets.only(left: 16),
          child: const Text(
            "Username",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 27),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 16),
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.93,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color.fromRGBO(67, 56, 107, 1),
                        Color.fromRGBO(62, 52, 99, 1),
                      ]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (result) => {usernameChange(result)},
                      decoration: InputDecoration.collapsed(
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: ProfileRetrevial().getUsername().capitalize(),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}
