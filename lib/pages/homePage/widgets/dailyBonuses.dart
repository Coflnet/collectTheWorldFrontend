import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DailyBonuses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: baseWidget(
            child: Container(
          margin: EdgeInsets.all(18),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "🏵️ Bonuses",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Row(
                  children: [
                    BonusWidget(multi: "1.25X", name: "Food"),
                    SizedBox(width: 8),
                    BonusWidget(multi: "2X", name: "Plants"),
                    SizedBox(width: 8),
                    BonusWidget(multi: "4X", name: "indoor"),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class BonusWidget extends StatelessWidget {
  final String multi;
  final String name;

  const BonusWidget({super.key, required this.multi, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(100, 80, 160, 1),
                  Color.fromRGBO(89, 68, 139, 1)
                ]),
            borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: EdgeInsets.all(4),
          child: Column(
            children: [
              Text(multi,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text(name),
              )
            ],
          ),
        ),
      ),
    );
  }
}
