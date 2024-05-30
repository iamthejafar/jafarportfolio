
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';


class ExperienceMobileWidget extends StatelessWidget {
  const ExperienceMobileWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryBg,
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Experience",
            style: GoogleFonts.raleway(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: primaryBg,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width: width * 0.4,
              //   child: Image.asset("assets/animations/experience.gif",fit: BoxFit.fitWidth,),
              // ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: lightBlueColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Software Engineer | Flutter",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryBg,
                            ),
                          ),
                          Text(
                            "Local24 Retail Private Ltd",
                            style: GoogleFonts.ibmPlexMono(
                              fontSize: 14,
                              color: brownColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Jan 2024 - Present",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          color: lightBlueColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter Developer",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryBg,
                            ),
                          ),
                          Text(
                            "OJAS Aerospace Private Ltd",
                            style: GoogleFonts.ibmPlexMono(
                              fontSize: 14,
                              color: brownColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Apr 2024 - Jan 2024",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          color: lightBlueColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment : CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter Intern",
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: primaryBg,
                            ),
                          ),
                          Text(
                            "Paroksya",
                            style: GoogleFonts.ibmPlexMono(
                              fontSize: 14,
                              color: brownColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Feb 2023 - Apr 2023",
                              style: GoogleFonts.ibmPlexMono(
                                fontSize: 12,
                                color: greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
