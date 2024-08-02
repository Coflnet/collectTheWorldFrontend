import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmingImageError extends StatelessWidget {
  final String errorMessage;

  const ConfirmingImageError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.62,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: baseWidget(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  textAlign: TextAlign.center,
                  "There was an error that we encountered if this continues make an report in the our discord and provide message below",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(119, 80, 119, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    onPressed: () =>
                        {Clipboard.setData(ClipboardData(text: errorMessage))},
                    child: const Text("Copy error",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
