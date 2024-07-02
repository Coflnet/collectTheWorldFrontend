import 'package:flutter/material.dart';

class RewardVariationHeader extends StatelessWidget {
const RewardVariationHeader({ super.key });

  @override
  Widget build(BuildContext context){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "🎉Congratulations",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
                Transform.flip(
                  flipX: true,
                  child: const Text(
                    "🎉",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              ],
            );
  }
}