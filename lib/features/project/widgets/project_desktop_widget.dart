import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../home/widgets/menu_button_widget.dart';

class ProjectDesktopWidget extends StatefulWidget {
  const ProjectDesktopWidget({
    super.key, required this.pageController,
  });

  final PageController pageController;

  @override
  State<ProjectDesktopWidget> createState() => _ProjectDesktopWidgetState();
}

class _ProjectDesktopWidgetState extends State<ProjectDesktopWidget> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.raleway(
              fontSize: 54,
              fontWeight: FontWeight.w700,
              color: secondaryBg,
            ),
          ),
          const Gap(20),
          SizedBox(
            height: height * 0.6,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                PageView(
                  controller: widget.pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/roadradar.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
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
                                        fontSize: 18,
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                                child: Row(
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
                                    // Gap(20),
                                    // MenuButton(
                                    //     title: "Figma",
                                    //     onPressed: () async {
                                    //       final url = Uri.parse("https://www.figma.com/design/6RE8zrf0DAP7rXrVDzzD8z/Monify?node-id=2%3A117&t=jVPw98thbqBop4AT-1");
                                    //       if(await canLaunchUrl(url)){
                                    //         await launchUrl(url);
                                    //       }
                                    //     }
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/monify.png",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                      "An - Expense Tracker App",
                                      style: GoogleFonts.ibmPlexMono(
                                        fontSize: 18,
                                        color: greyColor,
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
                                  const Gap(20),
                                  MenuButton(
                                      title: "Figma",
                                      onPressed: () async {
                                        final url = Uri.parse(
                                            "https://www.figma.com/design/6RE8zrf0DAP7rXrVDzzD8z/Monify?node-id=2%3A117&t=jVPw98thbqBop4AT-1");
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        }
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
                            int page = 1;
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
                              if(widget.pageController.page != 1){
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
            ),
          )
        ],
      ),
    );
  }
}
