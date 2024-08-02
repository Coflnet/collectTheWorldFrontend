


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalLinkButton extends StatelessWidget {
  const LegalLinkButton({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white10)),
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("🏛️", textScaler: TextScaler.linear(1.6),),
            const Text(
              "Legal links",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Container(margin: const EdgeInsets.only(left: 20),)
          ],
        ),
        onPressed: () => {linkPressed("https://coflnet.com/privacy")},
      ),
    );
  }

  void linkPressed(String urlString) {
    Uri url = Uri.parse(urlString);
    launchUrl(url);
  }
}