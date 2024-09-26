import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:collect_the_world/globals/globalScripts/systems/legalChangeUploader.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:google_sign_in/testing.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class RunNotifications extends StatefulWidget {
  const RunNotifications({Key? key}) : super(key: key);

  @override
  _RunNotificationsState createState() => _RunNotificationsState();
}

class _RunNotificationsState extends State<RunNotifications> {
  bool visible = false;
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
          channelKey: "day_reset_noti",
          channelName: "Streak Notification",
          channelDescription: "Alert you before you lose your streak")
    ]);
    print("${ProfileRetrevial().getnotificationsNeed} profile");
    print("legal ${ProfileRetrevial().getLegalDone}");
    if (!ProfileRetrevial().getnotificationsNeed &&
        LegalChangeUploader().getAlreadyAgreed) {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black38,
            child: Center(
              child: SizedBox(
                height: 200,
                width: MediaQuery.sizeOf(context).width * 0.75,
                child: baseWidget(
                    child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      const Text("Want to keep that streak?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 18)),
                      const SizedBox(height: 12),
                      Text(
                          "Turn on notification to remind you before your streak expires",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600)),
                      const Expanded(child: SizedBox()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          notificationButtons(
                              buttonColor: HexColor("4A4EBA"),
                              text: "Decline",
                              callback: () {
                                ProfileRetrevial().setnotificationsNeed = true;
                                setState(() {
                                  visible = false;

                                  LoadingProfileInfo().saveFile();
                                });
                              },
                              color: Colors.grey.shade200),
                          notificationButtons(
                              buttonColor: HexColor("4A4EBA"),
                              text: "Accept",
                              callback: handleConfirming,
                              color: Colors.white),
                        ],
                      )
                    ],
                  ),
                )),
              ),
            ),
          ),
        ));
  }

  void handleConfirming() async {
    if (await AwesomeNotifications().requestPermissionToSendNotifications()) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 1,
            channelKey: "day_reset_noti",
            title: "⚠️Don't Lose That Streak!",
            body: "📸Collect a image before the day ends!",
          ),
          schedule: NotificationCalendar(hour: 15, repeats: true));
    }

    setState(() {
      visible = false;
    });
    ProfileRetrevial().setnotificationsNeed = true;
    LoadingProfileInfo().saveFile();
  }
}

class notificationButtons extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final Color color;
  final Color buttonColor;
  const notificationButtons(
      {super.key,
      required this.text,
      required this.callback,
      required this.color,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: callback,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: color, fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ));
  }
}
