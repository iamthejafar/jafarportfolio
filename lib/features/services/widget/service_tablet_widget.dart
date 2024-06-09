import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/comman/widgets/tech_stack_auto_scroll_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_carousel.dart';

import '../../../core/theme/colors.dart';

class ServiceTabletWidget extends StatelessWidget {
  const ServiceTabletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: secondaryBg,
      height: height * 1.1,
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
                height: height * 0.6,
                width: width,
                child: ServiceCarousel(cardHeight: height * 0.6,  cardWidth: width * 0.7 ,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TechStackAutoScrollWidget(imageHeight: height * 0.09),
          )
        ],
      ),
    );
  }
}

