

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../../core/theme/colors.dart';


class AboutMobileWidget extends StatelessWidget {
  const AboutMobileWidget({
    super.key
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: secondaryBg,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: SizedBox(
              height: width * 0.4,
              width: width * 0.4,
              child: RiveAnimation.asset(
                  "animations/intro_animation.riv"),
            ),
          ),
          Column(
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
                      "I am Jafar Jalali, a versatile and skilled software engineer with a strong passion for developing innovative applications. My technical expertise spans multiple languages, including C++, Dart, Python, JavaScript, and Java. I am proficient in various developer tools such as Firebase, Git, Postman, Google Cloud Platform, Google Maps APIs, and more. I have extensive experience working with a range of technologies and frameworks like Flutter, Node.js, Spring Boot, FlutterFlow, and Figma, which enables me to create robust and user-friendly applications. \n\nMy skills in backend development are supported by my knowledge of Spring Boot, Node.js, and AWS, while my frontend capabilities are strengthened by my experience with Flutter and other UI frameworks. My ability to integrate complex systems, such as payment gateways and chat systems, demonstrates my comprehensive approach to software development. With a strong educational background in Information Technology, I am continually pushing the boundaries of what’s possible in the tech world.",
                      style: GoogleFonts.ibmPlexMono(fontSize: 14,color: brownColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
