import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscordLinkButton extends StatelessWidget {
  const DiscordLinkButton({super.key});

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
            const Icon(
              Icons.discord,
              color: Colors.blueAccent,
              size: 35,
            ),
            const Text(
              "Join The Discord",
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Container(margin: const EdgeInsets.only(left: 20),)
          ],
        ),
        onPressed: () => {linkPressed("https://discord.gg/VDTqy4MY4f")},
      ),
    );
  }

  void linkPressed(String urlString) {
    Uri url = Uri.parse(urlString);
    launchUrl(url);
  }
}
