import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileStoreWidget extends StatelessWidget {
  const ProfileStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 18, 24, 0),
      height: 200,
      width: double.infinity,
      child: const baseWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("💎 Store",
                style: TextStyle(color: Colors.white, fontSize: 28)),
            Text("🚧 In development 🏗️",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600)),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
