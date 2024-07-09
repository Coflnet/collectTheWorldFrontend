import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalMoreOptionsPage.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalOptionsButton.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalScrollContainer.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalVariationButton.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalVariationFirstPage.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/readAllPolicy.dart';
import 'package:flutter/material.dart';

class LegalVariationMain extends StatefulWidget {
  final String penalty;
  final VoidCallback disapear;
  const LegalVariationMain(
      {super.key, required this.penalty, required this.disapear});

  @override
  _LegalVariationMainState createState() => _LegalVariationMainState();
}

class _LegalVariationMainState extends State<LegalVariationMain> {
  bool inDone = false;
  bool moreOptions = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 500,
        child: baseWidget(
            child: (moreOptions)
                ? LegalVariationFirstPage(
                    moreOptions: updateMoreOptions,
                    penalty: widget.penalty,
                    disapear: widget.disapear)
                : LegalMoreOptionsPage()));
  }

  void updateMoreOptions() {
    setState(() {
      moreOptions = false;
    });
  }
}
