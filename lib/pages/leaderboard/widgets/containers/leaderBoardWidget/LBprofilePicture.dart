import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class TmpProfile extends StatelessWidget {
  final String profileImage;
  const TmpProfile({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return profileImage == ""
        ? Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.orangeAccent),
            child: Container(
                margin: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.person,
                  color: Colors.white70,
                  size: 30,
                )),
          )
        : RandomAvatar(profileImage, width: 48, height: 48);
  }
}
