import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/LegalMoreOptionsSetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfilePrivacy extends StatelessWidget {
  const EditProfilePrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 40),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Privacy",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30)),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: baseWidget(
              child: Container(
            padding: const EdgeInsets.fromLTRB(22, 16, 22, 8),
            child: const Column(
              children: <Widget>[
                LegalMoreOptionsSetting(
                  name: " ad targeting",
                  header: "Allow all",
                  which: 2,
                ),
                LegalMoreOptionsSetting(
                  name: " ad tracking",
                  header: "Allow all",
                  which: 3,
                ),
                LegalMoreOptionsSetting(
                  name: " usage analytics",
                  header: "Allow",
                  which: 4,
                ),
                LegalMoreOptionsSetting(
                  name: " image resale",
                  header: "Allow",
                  which: 5,
                ),
                LegalMoreOptionsSetting(
                  name: " use data for new services",
                  header: "Allow",
                  which: 6,
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
