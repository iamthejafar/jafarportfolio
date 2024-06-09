

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/colors.dart';


class ServiceFlipCard extends StatefulWidget {
  const ServiceFlipCard({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
    required this.technologies,
    required this.title,
    required this.imageName,
    this.flipColor = false,
  });

  final double cardWidth;
  final double cardHeight;
  final List<String> technologies;
  final String title;
  final String imageName;
  final bool flipColor;

  @override
  State<ServiceFlipCard> createState() => _ServiceFlipCardState();
}

class _ServiceFlipCardState extends State<ServiceFlipCard> {
  final flipController = FlipCardController();
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) async {
        await flipController.toggleCard();
      },
      onExit: (_) async {
        await flipController.toggleCard();
      },
      child: FlipCard(
        controller: flipController,
        front: SizedBox(
          height: widget.cardHeight,
          width: widget.cardWidth,
          child: Container(
            decoration: BoxDecoration(
                color: widget.flipColor ? brownColor : Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(2),
                SizedBox(
                    height: widget.cardHeight * 0.6,
                    child: Image.asset(
                      "assets/animations/${widget.imageName}",
                      fit: BoxFit.fitHeight,
                      height: widget.cardWidth * 0.6,
                    ),
                ),
                const Gap(10),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexMono(
                      fontSize: 16,
                      color: widget.flipColor ? Colors.white : brownColor,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10)
              ],
            ),
          ),
        ),
        back: SizedBox(
          height: widget.cardHeight,
          width: widget.cardWidth,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: widget.flipColor ? Colors.white : brownColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      spreadRadius: 2)
                ],
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final item in widget.technologies)
                  Text(
                    "• $item",
                    style:
                    GoogleFonts.ibmPlexMono(fontSize: 20, color: widget.flipColor ? primaryBg : secondaryBg),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
