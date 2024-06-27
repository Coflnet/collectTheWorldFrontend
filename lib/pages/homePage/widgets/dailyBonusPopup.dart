import 'package:flutter/material.dart';

class DailyBonusPopup extends StatelessWidget {
const DailyBonusPopup({ super.key });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(151, 129, 234, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          Text(
            "Collect items that correspond to a catagory",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white70),
          ),
          Text(
            "Rewards the respective multiplier",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white60),
          ),
        ],
      ),
    );
  }
}