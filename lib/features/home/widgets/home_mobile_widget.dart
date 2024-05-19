import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import 'home_desktop_widget.dart';
class HomeMobileWidget extends StatelessWidget {
  const HomeMobileWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('I am Jafar Jalali',
                    style: GoogleFonts.raleway(
                        fontSize: 44,
                        fontWeight: FontWeight.w700,
                        color: secondaryBg),),
                  DefaultTextStyle(
                    style: GoogleFonts.ibmPlexMono(
                        fontSize: 16, color: greyColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height:30,
                          child: Image.asset('images/caret.png'),),
                        Gap(10),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'A Mobile App Developer',
                                speed: Duration(milliseconds: 100)),
                            TypewriterAnimatedText(
                                'Specialized in Flutter',
                                speed: Duration(milliseconds: 100)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Gap(30),
                  Row(
                    children: [
                      SocialLink(
                        assetName: "github",
                        onTap: () async {
                          final url = Uri.parse("https://github.com/iamthejafar");

                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }
                        },
                      ),
                      Gap(10),
                      SocialLink(
                        assetName: "linkedin",
                        onTap: () async {
                          final url = Uri.parse("https://www.linkedin.com/in/jafarjalali128/");

                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }
                        },
                      ),
                      Gap(10),
                      SocialLink(
                        assetName: "leetcode",
                        onTap: () async {
                          final url = Uri.parse("https://leetcode.com/u/jafarjalali128/");

                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }
                        },
                      ),
                      Gap(10),
                      SocialLink(
                        assetName: "x",
                        onTap: () async {
                          final url = Uri.parse("https://x.com/iamthejafar");

                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: "profile",
                  child: CircleAvatar(
                    radius: height * 0.2,
                    backgroundImage: Image.network(
                        "https://media.licdn.com/dms/image/D4D03AQGkMuI3phuvFg/profile-displayphoto-shrink_800_800/0/1710682345759?e=1721865600&v=beta&t=xrqd5I1Z-HJsh59x7gIDvgFkBQ5xCJ996OAXXBrOJLw")
                        .image,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

