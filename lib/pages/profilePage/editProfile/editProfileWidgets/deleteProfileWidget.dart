import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteProfileWidget extends StatelessWidget {
  final VoidCallback callBack;
  const DeleteProfileWidget({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(26, 24, 26, 8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[600] ?? Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                onPressed: callBack,
                child: Text(
                  "Delete Acccount",
                  style: TextStyle(
                      color: Colors.grey.shade300, fontWeight: FontWeight.w600, fontSize: 15),
                )),
          ),
        ),
      ],
    );
  }
}
