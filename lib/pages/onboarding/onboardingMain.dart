import 'package:collect_the_world/background/backgroundGradiant.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  OnboardingMainState createState() => OnboardingMainState();
}

class OnboardingMainState extends State<OnboardingMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Rubik'),
      home: const Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            BackgroundGradiant(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                  'Take pictures of\n Objects',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),),
                Text("📷", style: TextStyle(fontSize: 200)),
                SizedBox(),
                Column(
                  children: <Widget>[Text(
                  "Collect The World",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )],
                ),
                SizedBox(),

              ],
            )
          ],
        ),
      ),
    );
  }
}
