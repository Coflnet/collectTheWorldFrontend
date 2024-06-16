import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GenerateNewProfilePic extends StatelessWidget {
  final VoidCallback generate;
  const GenerateNewProfilePic({super.key, required this.generate});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          generate();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 80, 119, 1),
              borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Generate Avatar",
            style: TextStyle(
                color: HexColor("#FFFADE"),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
