

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../../comman/widgets/service_flip_card.dart';
import '../../../core/theme/colors.dart';

class ServiceCarousel extends StatelessWidget {
  const ServiceCarousel({
    super.key,
    required this.cardHeight, required this.cardWidth,
  });

  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        indicatorMargin: 6,
        viewportFraction: 20,
        showIndicator: true,
        floatingIndicator: false,
        slideIndicator: const CircularSlideIndicator(
            currentIndicatorColor: brownColor,
            indicatorBackgroundColor: greyColor),
      ),
      items: [
        Container(
          margin: const EdgeInsets.all(5),
          child: ServiceFlipCard(
            cardHeight: cardHeight,
            cardWidth: cardWidth,
            technologies: const ["Flutter", "Kotlin", " Jetpack Compose"],
            title: 'Mobile App Development',
            imageName: 'mobile.gif',
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: ServiceFlipCard(
            flipColor: true,
            cardHeight: cardHeight,
            cardWidth: cardWidth,
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
        Container(
          margin: const EdgeInsets.all(5),
          child: ServiceFlipCard(
            cardHeight: cardHeight,
            cardWidth: cardWidth,
            technologies: const ["Flutter"],
            title: 'Web Development',
            imageName: 'web.gif',
          ),
        ),
      ],);
  }
}
