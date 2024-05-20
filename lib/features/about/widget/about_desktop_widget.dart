import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../../core/theme/colors.dart';


class AboutDesktopWidget extends StatelessWidget {
  const AboutDesktopWidget({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: secondaryBg,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Row(
        children: [
          Align(
            child: SizedBox(
              height: width * 0.4,
              width: width * 0.4,
              child: RiveAnimation.asset(
                  "assets/animations/intro_animation.riv"),
            ),
            alignment: Alignment.center,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "About Me",
                  style: GoogleFonts.raleway(
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                    color: primaryBg,
                  ),
                ),
                Gap(10),
                Text("Who Am I ?",style: GoogleFonts.rajdhani(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  color: skyBlueColor,
                ),),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 40,
                        overflow: TextOverflow.ellipsis,
                        "I am Jafar Jalali, a versatile software engineer passionate about developing innovative applications. My expertise includes C++, Dart, Python, JavaScript, Java, and tools like Firebase, Git, Postman, and Google Cloud Platform. I have extensive experience with Flutter, Node.js, Spring Boot, and Figma, enabling me to create robust, user-friendly applications.\n\nMy backend skills include Spring Boot, Node.js, and AWS, while my frontend abilities are strengthened by Flutter and other UI frameworks. I excel at integrating complex systems such as payment gateways and chat systems. With a strong IT background, I continually push the boundaries of technology.",
                        style: GoogleFonts.ibmPlexMono(
                            fontSize: 14, color: brownColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
