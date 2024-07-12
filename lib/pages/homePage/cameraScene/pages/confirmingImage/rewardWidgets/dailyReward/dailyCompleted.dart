import 'package:flutter/material.dart';

class DailyCompleted extends StatelessWidget {
  const DailyCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Completed",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22),
        ),
        SizedBox(width: 30)
      ],
    );
  }
}
