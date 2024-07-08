import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalScrollContainer extends StatefulWidget {
  const LegalScrollContainer({Key? key}) : super(key: key);

  @override
  _LegalScrollContainerState createState() => _LegalScrollContainerState();
}

class _LegalScrollContainerState extends State<LegalScrollContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (!isTop) {
        _onEndReached();
      }
    }
  }

  void _onEndReached() {
    print('End of scroll reached');
  }

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 16.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);
    return Container(
        height: 400,
        child: SingleChildScrollView(
            controller: _scrollController,
            child: RichText(
              text: TextSpan(
                style: defaultStyle,
                children: [
                  const TextSpan(
                      text:
                          "Introduction\nThis Privacy Policy outlines the terms under which users interact with our service, particularly regarding the upload, use, and management of images. By using our service, you agree to the following terms and conditions in addition to our"),
                  TextSpan(
                    text:
                        " regular privacy policy (https://coflnet.com/privacy)",
                    style: linkStyle,
                  ),
                  const TextSpan(
                      text:
                          '\n\nImage Upload and Licensing\nWhen you upload images to our platform, you grant us an unlimited use license in exchange for free use of our service. This means that we have the right to use, reproduce, modify, distribute, and display the images without restriction. This license is irrevocable and perpetual.\n\nAnonymized Use of Images\nThe images you upload may be anonymized and used to build new products. Anonymization ensures that the images cannot be traced back to you, thus protecting your privacy while allowing us to innovate and create new offerings.\n\nSale of Images\nWe reserve the right to sell the images you upload, along with their accompanying descriptions. However, these images will not be publicized. This includes use in various commercial applications without making them publicly accessible.\n\nImage Deletion\nUsers have the right to delete their images from our platform at any time. Upon deletion, the images will be removed from our active databases and will no longer be available for use or sale. However, please note that any prior use or distribution of the images cannot be retracted.\n\nAd Targeting\nAd targeting will only be conducted with your explicit consent. We respect your privacy and will not use your data for targeted advertising purposes unless you have provided clear permission to do so. Selecting "no targeted ads" includes uploading images; declining all ads means not uploading any images.\n\nUser Responsibility\nBy uploading images, you confirm that you are old enough to do so and have the necessary permissions for all content depicted in the images. This includes obtaining consent from any individuals featured in the images and ensuring that the images do not infringe on any third-party rights.\n\nContact Us\nIf you have any questions or concerns about our Privacy Policy,'),
                  TextSpan(
                      text: " please contact our support [support@coflnet.com]",
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchMailto();
                        }),
                  const TextSpan(
                      text:
                          '\n\nChanges to this Policy\nWe may update this Privacy Policy from time to time to reflect changes in our practices or for other operational, legal, or regulatory reasons. We will notify you of any significant changes by showing the new policy when you open the app.\n\nBy using our service, you acknowledge that you have read, understood, and agree to the terms of this Privacy Policy.'),
                ],
              ),
            )));
  }

  void _launchMailto() async {
    final mailToLink =
        Mailto(to: ["support@coflnet.com"], subject: "Support help");
    await launch(mailToLink.toString());
  }
}
