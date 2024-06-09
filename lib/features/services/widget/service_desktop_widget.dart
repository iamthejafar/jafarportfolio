import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/constants.dart';

import '../../../core/theme/colors.dart';

class ServiceDesktopWidget extends StatefulWidget {
  const ServiceDesktopWidget({
    super.key,
  });

  @override
  State<ServiceDesktopWidget> createState() => _ServiceDesktopWidgetState();
}

class _ServiceDesktopWidgetState extends State<ServiceDesktopWidget> {
  final mobileController = FlipCardController();
  final backEndController = FlipCardController();
  final webController = FlipCardController();

  final ScrollController _scrollController = ScrollController();
  bool _scrollingDown = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 1), _autoScroll);
  }

  void _autoScroll() {
    if (_scrollController.hasClients) {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double minScroll = _scrollController.position.minScrollExtent;

      if (_scrollingDown) {
        _scrollController.animateTo(
          maxScroll,
          duration: const Duration(seconds: 5),
          curve: Curves.linear,
        ).then((value) {
          setState(() {
            _scrollingDown = false;
          });
          _startAutoScroll();
        });
      } else {
        _scrollController.animateTo(
          minScroll,
          duration: const Duration(seconds: 5),
          curve: Curves.linear,
        ).then((value) {
          setState(() {
            _scrollingDown = true;
          });
          _startAutoScroll();
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: MouseRegion(
                            onEnter: (_) async {
                              await mobileController.toggleCard();
                            },
                            onExit: (_) async {
                              await mobileController.toggleCard();
                            },
                            child: FlipCard(
                              controller: mobileController,
                              front: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 4,
                                            spreadRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          height: height * 0.3,
                                          child: Image.asset(
                                            "assets/animations/mobile.gif",
                                            fit: BoxFit.fitHeight,
                                          )),
                                      const Gap(10),
                                      Text(
                                        "Mobile App Development",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 16,
                                            color: brownColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: brownColor,
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
                                      Text(
                                        "• Flutter",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: secondaryBg),
                                      ),
                                      Text(
                                        "• Kotlin",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: secondaryBg),
                                      ),
                                      Text(
                                        "• Jetpack Compose",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: secondaryBg),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width*0.05,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: MouseRegion(
                            onEnter: (_) async {
                              await backEndController.toggleCard();
                            },
                            onExit: (_) async {
                              await backEndController.toggleCard();
                            },
                            child: FlipCard(
                              controller: backEndController,
                              front: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: brownColor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 4,
                                            spreadRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          height: height * 0.3,
                                          child: Image.asset(
                                              "assets/animations/backend.gif")),
                                      const Gap(10),
                                      Text(
                                        "Backend Development",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 16,
                                            color: secondaryBg,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
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
                                      Text(
                                        "• Node.js",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: brownColor),
                                      ),
                                      Text(
                                        "• Firebase",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: brownColor),
                                      ),
                                      Text(
                                        "• AWS",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: brownColor),
                                      ),
                                      Text(
                                        "• GCP",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: brownColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width*0.05,),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: MouseRegion(
                            onEnter: (_) async {
                              await webController.toggleCard();
                            },
                            onExit: (_) async {
                              await webController.toggleCard();
                            },
                            child: FlipCard(
                              controller: webController,
                              front: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(0.1),
                                            blurRadius: 4,
                                            spreadRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                          height: height * 0.3,
                                          child: Image.asset(
                                              "assets/animations/web.gif")),
                                      const Gap(10),
                                      Text(
                                        "Web Development",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 16,
                                            color: brownColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: SizedBox(
                                height: height * 0.40,
                                width: 290,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: brownColor,
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
                                      Text(
                                        "• Flutter",
                                        style: GoogleFonts.ibmPlexMono(
                                            fontSize: 20, color: secondaryBg),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
            child: Column(
              children: [
                Text(
                  "Tech Stack",
                  style: GoogleFonts.rajdhani(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    color: skyBlueColor,
                  ),
                ),
                const Gap(30),
                SizedBox(
                  height: height * 0.1,
                  child: ListView.builder(
                    itemCount: logoUrls.length,
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: height * 0.1,
                          child: Image.asset("assets/images/${logoUrls[index]}.png",fit: BoxFit.fitHeight,),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
