import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileNotifications extends StatelessWidget {
  const EditProfileNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Notifications",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
            child: const baseWidget(
                child: Center(
              child: Text(
                "🔨 In Development 🧰",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            )))
      ],
    );
  }
}
