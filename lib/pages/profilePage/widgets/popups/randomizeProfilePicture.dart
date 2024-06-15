import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomizeProfilePicture extends StatelessWidget {
  const RandomizeProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6,),
      decoration: BoxDecoration(
          color: Colors.purple[500], borderRadius: BorderRadius.circular(8)),
          child: Text("Randomize", style: TextStyle(color: Colors.white, fontSize: 15),),
    );
  }
}
