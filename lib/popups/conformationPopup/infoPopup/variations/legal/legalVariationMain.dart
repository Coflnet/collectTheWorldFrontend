import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalScrollContainer.dart';
import 'package:collect_the_world/popups/conformationPopup/infoPopup/variations/legal/legalVariationButton.dart';
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 400,
      child: baseWidget(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 8),
              const Expanded(flex: 7, child: LegalScrollContainer()),
              const SizedBox(height: 8),
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        textAlign: TextAlign.center,
                        "By Accept you herby blah blah blah",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          LegalVariationButton(
                              disapear: widget.disapear, buttonText: "Decline"),
                          LegalVariationButton(
                              disapear: widget.disapear, buttonText: "Accept"),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
