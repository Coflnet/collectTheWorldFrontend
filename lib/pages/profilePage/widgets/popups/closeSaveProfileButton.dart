import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CloseSaveProfileButton extends StatelessWidget {
  final bool saveClose;
  const CloseSaveProfileButton({super.key, required this.saveClose});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 9),
              decoration: BoxDecoration(
                  color: HexColor("#6430FF"),
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                saveClose ? "exit" : "save",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ))
      ],
    );
  }
}
