


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../home/widgets/menu_button_widget.dart';




class ProjectTabletWidget extends StatefulWidget {
  const ProjectTabletWidget({
    super.key, required this.pageController,
  });

  final PageController pageController;

  @override
  State<ProjectTabletWidget> createState() => _ProjectTabletWidgetState();
}

class _ProjectTabletWidgetState extends State<ProjectTabletWidget> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(30),
      height: height* 1.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Projects",
                style: GoogleFonts.raleway(
                  fontSize: 44,
                  fontWeight: FontWeight.w700,
                  color: secondaryBg,
                ),
              ),
              MenuButton(
                title: "View More",
                onPressed: () async {
                  final url = Uri.parse("https://github.com/iamthejafar");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              )
            ],
          ),
          const Gap(20),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              SizedBox(
                height: height,
                child: PageView(
                  controller: widget.pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Road Radar",
                                style: GoogleFonts.raleway(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: secondaryBg,
                                ),
                              ),
                              Text(
                                "Full stack Mobile application built with flutter and node.js. Focuses on Road Safety and hazard monitoring and reporting system.",
                                style: GoogleFonts.ibmPlexMono(
                                  color: greyColor,
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            MenuButton(
                                title: "Github",
                                onPressed: () async {
                                  final url = Uri.parse(
                                      "https://github.com/iamthejafar/RoadRadar");
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                }),
                          ],
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              height: height * 0.6,
                              "assets/images/roadradar.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Monify",
                                style: GoogleFonts.raleway(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: secondaryBg,
                                ),
                              ),
                              Text(
                                "An - Expense Tracker App, for managing your day to day expenses.",
                                style: GoogleFonts.ibmPlexMono(
                                  color: greyColor,
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            MenuButton(
                                title: "Github",
                                onPressed: () async {
                                  final url = Uri.parse(
                                      "https://github.com/iamthejafar/monify");
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                }),
                          ],
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              height: height * 0.6,
                              "assets/images/monify.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Flash Chat",
                                style: GoogleFonts.raleway(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                  color: secondaryBg,
                                ),
                              ),
                              Text(
                                "A Simple chatting application, built with Flutter, having Firebase as backend, Supports one to one and group chat, Equipped with all the basic functionalities of chatting application.",
                                style: GoogleFonts.ibmPlexMono(
                                  color: greyColor,
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            MenuButton(
                                title: "Github",
                                onPressed: () async {
                                  final url = Uri.parse(
                                      "https://github.com/iamthejafar/FlashChat");
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                }),
                          ],
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              height: height * 0.6,
                              "assets/images/flashchat.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          int page = widget.pageController.positions.length+1;
                          if(widget.pageController.page != null){
                            if(widget.pageController.page != 0){
                              page = int.parse(widget.pageController.page.toString()) - 1;
                            }
                          }

                          widget.pageController.animateToPage(page,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);

                        },
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                          size: 30,
                          color: greyColor,
                        )),
                    IconButton(
                      onPressed: () {
                        int page = 0;
                        if(widget.pageController.page != null){
                          if(widget.pageController.page != widget.pageController.positions.length+1){
                            page = int.parse(widget.pageController.page.toString()) + 1;
                          }
                        }

                        widget.pageController.animateToPage(page,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);

                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_right,
                        size: 30,
                        color: greyColor,
                      ),),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
