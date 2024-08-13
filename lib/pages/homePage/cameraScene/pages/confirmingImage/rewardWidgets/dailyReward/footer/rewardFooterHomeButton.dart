import 'package:collect_the_world/main.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

class RewardFooterHomeButton extends StatelessWidget {
const RewardFooterHomeButton({ super.key });

  @override
  Widget build(BuildContext context){
    return IconButton(
      iconSize: 55,
      icon: const Icon(Icons.home_outlined,
          color: Color.fromRGBO(80, 173, 255, 1)),
      onPressed: () => {
        Haptics.vibrate(HapticsType.light),
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
              transitionDuration: const Duration(milliseconds: 0),
            ))
      },
    );
  }
}