import 'dart:io';

import 'package:collect_the_world/globals/globalWidgets/baseWidget/baseWidget.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/discordLinkButton.dart';
import 'package:collect_the_world/pages/profilePage/widgets/linkButtons/legalLinkButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksWidget extends StatelessWidget {
  const LinksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const baseWidget(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("🔗 Links", style: TextStyle(color: Colors.white, fontSize: 25),)],
            ),
            
            DiscordLinkButton(),
            LegalLinkButton(),
          ],
        ),
      ),
    );
  }

  void linkPressed(String urlString) {
    Uri url = Uri.parse(urlString);
    launchUrl(url);
  }
}
