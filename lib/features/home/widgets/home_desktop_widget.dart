import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../comman/widgets/custom_animated_grid.dart';
import '../../../constants.dart';
import '../../../core/theme/colors.dart';
import '../screens/home_screen.dart';
class HomeDesktopWidget extends StatelessWidget {
  const HomeDesktopWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const CustomAnimatedGrid(),

        Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('I am Jafar Jalali',
                          style: GoogleFonts.raleway(
                              fontSize: 64,
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
                                child: Image.asset('assets/images/caret.png'),),
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
                  Hero(
                    tag: "profile",
                    child: CircleAvatar(
                      radius: height * 0.2,
                      backgroundImage: Image.asset(profileString).image,

                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SocialLink extends StatelessWidget {
  const SocialLink({
    super.key, required this.assetName, required this.onTap,
  });

  final void Function() onTap;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: secondaryBg,
            borderRadius: BorderRadius.circular(8)
        ),
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset("assets/images/${assetName}.png",),
        ),
      ),
    );
  }
}

