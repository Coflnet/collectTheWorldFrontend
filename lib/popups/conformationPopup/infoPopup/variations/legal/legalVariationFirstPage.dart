import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalOptionsButton.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalScrollContainer.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalVariationButton.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/readAllPolicy.dart';
import 'package:flutter/material.dart';

class LegalVariationFirstPage extends StatefulWidget {
  final String penalty;
  final VoidCallback disapear;
  final VoidCallback moreOptions;

  const LegalVariationFirstPage(
      {super.key,
      required this.penalty,
      required this.disapear,
      required this.moreOptions});

  @override
  _LegalVariationFirstPageState createState() =>
      _LegalVariationFirstPageState();
}

class _LegalVariationFirstPageState extends State<LegalVariationFirstPage> {
  bool inDone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 8),
          Expanded(
              flex: 9,
              child: LegalScrollContainer(
                endScroll: finnishedScrolling,
              )),
          const SizedBox(height: 8),
          ReadAllPolicy(isDone: inDone),
          const SizedBox(height: 6),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    textAlign: TextAlign.center,
                    "Choose the option\n you prefer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      LegalVariationButton(
                        disapear: widget.disapear,
                        buttonText: "Decline",
                        isDone: true,
                      ),
                      LegalVariationButton(
                        disapear: disapearCallBack,
                        buttonText: "Accept",
                        isDone: inDone,
                      ),
                    ],
                  ),
                  LegalOptionsButton(moreOptions: widget.moreOptions)
                ],
              )),
        ],
      ),
    );
  }

  void disapearCallBack() {
    LegalChangeUploader().setIsChanged = true;
    LegalChangeUploader().submiteChanges();
    widget.disapear();
  }

  void finnishedScrolling() {
    setState(() {
      inDone = true;
    });
  }
}
