import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlreadySignedIn extends StatelessWidget {
  const AlreadySignedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "🔌Your all connected!",
            style: TextStyle(
                color: Colors.grey[200],
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
