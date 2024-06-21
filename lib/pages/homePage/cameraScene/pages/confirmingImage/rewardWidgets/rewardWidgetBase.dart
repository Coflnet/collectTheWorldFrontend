import 'package:flutter/material.dart';

class RewardWidgetBase extends StatelessWidget {
  final Widget child;

  const RewardWidgetBase({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade500, width: 2.3)
        // gradient: const LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Color.fromRGBO(73, 64, 119, 1),
        //     Color.fromRGBO(62, 52, 99, 1),
        //   ],
        // )),
      ),
      child: child,
    );
  }
}
