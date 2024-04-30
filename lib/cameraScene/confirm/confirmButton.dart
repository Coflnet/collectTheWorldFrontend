import 'dart:ui';
import 'package:collect_the_world/cameraScene/finalConformation.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: 83,
              height: 83,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 207, 207, 207).withOpacity(0.04),
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                    color: const Color.fromARGB(43, 255, 255, 255), width: 0.7),
              ),
              child: IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FinalConformationScene()))
                      },
                  icon: const Icon(
                    Icons.check_rounded,
                    color: Colors.orange,
                    size: 60,
                  )),
            ),
          ),
        ));
  }
}
