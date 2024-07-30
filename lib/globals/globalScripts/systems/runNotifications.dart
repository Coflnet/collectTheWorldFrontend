import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

class RunNotifications {
  void initNotifications() async {
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    startNotification();
  }

  void startNotification() async {
    final runningNotifications =
        await flutterLocalNotificationsPlugin.getActiveNotifications();
    if (runningNotifications.isNotEmpty) {
      return;
    }
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'U!YSKJoa98092liJ!*Up0silkh109', 'CTW notifications',
            channelDescription: 'alert you when your streak will end',
            importance: Importance.high,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    final now = tz.TZDateTime.now(tz.local);
    final fourPM =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 16, 0, 0);
    final scheduledTime = fourPM.add(const Duration(days: 1));

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Collect an image!📷',
        'Collect an image before the end of the day!',
        scheduledTime,
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
    ProfileRetrevial().setnotificationsNeed = false;
  }

  void cancleTodays() {
    flutterLocalNotificationsPlugin.cancelAll();
    startNotification();
  }
}
