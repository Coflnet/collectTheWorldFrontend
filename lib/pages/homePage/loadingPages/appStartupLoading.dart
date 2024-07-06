import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:collect_the_world/globals/globalScripts/systems/authClient.dart';
import 'package:collect_the_world/globals/globalScripts/systems/profilePicture.dart';
import 'package:collect_the_world/main.dart';
import 'package:collect_the_world/pages/homePage/loadingPages/appStartupLogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppStartupLoading extends StatefulWidget {
  const AppStartupLoading({Key? key}) : super(key: key);

  @override
  _AppStartupLoadingState createState() => _AppStartupLoadingState();
}

class _AppStartupLoadingState extends State<AppStartupLoading> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
            body: Stack(
      children: [BackgroundGradiant(), AppStartupLogo()],
    )));
  }
}
