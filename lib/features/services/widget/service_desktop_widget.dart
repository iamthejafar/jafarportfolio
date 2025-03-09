import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/comman/widgets/tech_stack_auto_scroll_widget.dart';
import 'package:jafarportfolio/constants.dart';

import '../../../comman/widgets/service_flip_card.dart';
import '../../../core/theme/colors.dart';

class ServiceDesktopWidget extends StatefulWidget {
  const ServiceDesktopWidget({
    super.key,
  });

  @override
  State<ServiceDesktopWidget> createState() => _ServiceDesktopWidgetState();
}

class _ServiceDesktopWidgetState extends State<ServiceDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: secondaryBg,
      height: height,
      width: width,
      child: Column(
        children: [
          Text(
            "What I can do ?",
            style: GoogleFonts.rajdhani(
              fontSize: 54,
              fontWeight: FontWeight.w700,
              color: primaryBg,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: height * 0.40,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const ["Flutter", "Kotlin", "Jetpack Compose"],
                            title: 'Mobile App Development',
                            imageName: 'mobile.gif',
                          ),
                        ),
                        SizedBox(width: width * 0.05,),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: ServiceFlipCard(
                            flipColor: true,
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const [
                              "Node.js",
                              "Spring Boot",
                              "Firebase",
                              "AWS",
                              "GCP"
                            ],
                            title: 'Backend Development',
                            imageName: 'backend.gif',
                          ),
                        ),
                        SizedBox(width: width * 0.05,),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const ["Flutter"],
                            title: 'Web Development',
                            imageName: 'web.gif',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TechStackAutoScrollWidget(imageHeight: height * 0.1,titleFontSize: 34,scrollSeconds: 7,),
          )
        ],
      ),
    );
  }
}
