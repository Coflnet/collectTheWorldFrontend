import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:flutter/material.dart';

class LegalMoreOptionsSetting extends StatefulWidget {
  final String name;
  final String header;
  final int which;
  const LegalMoreOptionsSetting(
      {super.key,
      required this.name,
      required this.header,
      required this.which});

  @override
  _LegalMoreOptionsSettingState createState() =>
      _LegalMoreOptionsSettingState();
}

class _LegalMoreOptionsSettingState extends State<LegalMoreOptionsSetting> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.header,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
              Text(
                widget.name,
                style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ],
          ),
          Switch(
              value: isSwitched,
              onChanged: (value) => {
                    LegalChangeUploader().makeChange(widget.which, value),
                    setState(() {
                      isSwitched = value;
                    })
                  })
        ],
      ),
    );
  }
}
