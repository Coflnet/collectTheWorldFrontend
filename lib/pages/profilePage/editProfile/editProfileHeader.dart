import 'package:collect_the_world/pages/profilePage/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditProfileHeader extends StatelessWidget {
  final VoidCallback saveCallBack;
  const EditProfileHeader({super.key, required this.saveCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 37),
      height: 60,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey[500] ?? Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            icon: Icon(Icons.close_rounded, color: Colors.grey[600], size: 35),
          ),
          Text("   Profile",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 25,
                  fontWeight: FontWeight.w600)),
          TextButton(
              onPressed: () => {saveCallBack()},
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(119, 80, 119, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ))
        ],
      ),
    );
  }
}
