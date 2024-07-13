import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmingImageError extends StatelessWidget {
  final String errorMessage;

  const ConfirmingImageError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.62,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: baseWidget(
        child: Container(
          child: Column(
            children: <Widget>[
              const Text(
                  "There was an error that we encountered if this continues make an report in the our discord and provide message below"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(119, 80, 119, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () =>
                      {Clipboard.setData(ClipboardData(text: errorMessage))},
                  child: const Text("Copy error id",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
