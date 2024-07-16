import 'package:collect_the_world/pages/profilePage/editProfile/connectAccountWidgets/connectAccountContent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectAccountMain extends StatelessWidget {
  const ConnectAccountMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 15),
        const Text(
          ' Account',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[10] ?? Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8)),
            child: const ConnectAccountContent())
      ],
    );
  }
}
