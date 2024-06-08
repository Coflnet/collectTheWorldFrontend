import 'package:flutter/material.dart';

class TmpProfile extends StatelessWidget {
  const TmpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.orangeAccent),
      child: Container(
          margin: const EdgeInsets.all(8),
          child: const Icon(
            Icons.person,
            color: Colors.white70,
            size: 30,
          )),
    );
  }
}
