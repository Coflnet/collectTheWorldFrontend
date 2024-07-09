import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hexcolor/hexcolor.dart';

class LegalVariationButton extends StatelessWidget {
  final VoidCallback disapear;
  final String buttonText;
  final bool isDone;
  const LegalVariationButton({
    super.key,
    required this.disapear,
    required this.buttonText,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(119, 80, 119, 1),
              borderRadius: BorderRadius.circular(8)),
          child: TextButton(
            onPressed: disapear,
            child: Text(buttonText,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24)),
          ),
        ),
        Visibility(
          visible: !isDone,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: const Text("Accept",
                  style: TextStyle(color: Colors.transparent, fontSize: 30)),
            ),
          ),
        ),
        Visibility(
          visible: !isDone,
          child: Icon(
            Icons.lock_outline,
            color: Colors.grey[300],
            shadows: [Shadow(color: Colors.black38, offset: Offset(2,4), blurRadius: 10)],
            size: 50,
          ),
        ),
      ],
    );
  }
}
