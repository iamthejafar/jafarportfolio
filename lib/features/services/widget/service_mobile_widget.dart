import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/features/services/widget/service_carousel.dart';

import '../../../comman/widgets/tech_stack_auto_scroll_widget.dart';
import '../../../core/theme/colors.dart';

class ServiceMobileWidget extends StatefulWidget {
  const ServiceMobileWidget({
    super.key,
  });

  @override
  State<ServiceMobileWidget> createState() => _ServiceMobileWidgetState();
}

class _ServiceMobileWidgetState extends State<ServiceMobileWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: secondaryBg,
      height: height * 0.8,
      width: width,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What I can do ?",
            style: GoogleFonts.rajdhani(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: primaryBg,
            ),
          ),
          const Gap(20),
          Center(
            child: SizedBox(
              height: height * 0.35,
              width: width,
              child: ServiceCarousel(cardHeight: height * 0.35,  cardWidth: width * 0.7 ,),
            ),
          ),          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TechStackAutoScrollWidget(
              imageHeight: height * 0.05,
            ),
          )
        ],
      ),
    );
  }
}

