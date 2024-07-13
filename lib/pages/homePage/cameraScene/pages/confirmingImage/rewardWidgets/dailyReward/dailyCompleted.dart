import 'package:flutter/material.dart';

class DailyCompleted extends StatelessWidget {
  const DailyCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Completed",
          style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        const SizedBox(width: 30)
      ],
    );
  }
}
