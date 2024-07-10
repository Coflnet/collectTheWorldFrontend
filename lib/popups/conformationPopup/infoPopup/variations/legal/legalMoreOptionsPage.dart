import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/LegalMoreOptionsSetting.dart';
import 'package:flutter/material.dart';

class LegalMoreOptionsPage extends StatelessWidget {
  final VoidCallback disapear;
  const LegalMoreOptionsPage({super.key, required this.disapear});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          const LegalMoreOptionsSetting(
            name: " ad targeting",
            header: "Allow all",
            which: 2,
          ),
          const LegalMoreOptionsSetting(
            name: " ad tracking",
            header: "Allow all",
            which: 3,
          ),
          const LegalMoreOptionsSetting(
            name: " usage analytics",
            header: "Allow",
            which: 4,
          ),
          const LegalMoreOptionsSetting(
            name: " image resale",
            header: "Allow",
            which: 5,
          ),
          const LegalMoreOptionsSetting(
            name: " use data for new services",
            header: "Allow",
            which: 6,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(119, 80, 119, 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextButton(
                        onPressed: () => {
                              LegalChangeUploader().submiteChanges(),
                              disapear()
                            },
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
