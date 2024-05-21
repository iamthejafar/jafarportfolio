import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/features/about/widget/about_mobile_widget.dart';
import 'package:jafarportfolio/features/home/widgets/home_mobile_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_desktop_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_mobile_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_desktop_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_mobile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../about/widget/about_desktop_widget.dart';
import '../widgets/home_desktop_widget.dart';
import '../widgets/menu_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: brownColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuButton(
                onPressed: () {
                  scrollController.animateTo(
                      duration: const Duration(milliseconds: 200),
                      scrollController.position.minScrollExtent,
                      curve: Curves.decelerate);
                },
                title: "Home",
              ),
              MenuButton(
                onPressed: () {
                  scrollController.animateTo(
                      duration: const Duration(milliseconds: 200),
                      height * 0.4,
                      curve: Curves.decelerate);
                },
                title: "About",
              ),
              MenuButton(
                onPressed: () {
                  scrollController.animateTo(
                      duration: const Duration(milliseconds: 200),
                      height * 1.1,
                      curve: Curves.decelerate);
                },
                title: "Services",
              ),
              MenuButton(
                onPressed: () {},
                title: "Projects",
              ),
              MenuButton(
                onPressed: () {},
                title: "Experience",
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(greyColor),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () async {
                    final url = Uri.parse(
                        "https://drive.google.com/file/d/1HAaKhzjC8Pt3cqq89pP77T65VpgfDnvC/view?usp=sharing");

                    if (await canLaunchUrl(url)) await launchUrl(url);
                  },
                  child: Text(
                    "Resume",
                    style: GoogleFonts.ibmPlexMono(
                        fontSize: 14, color: primaryBg),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: primaryBg,
      appBar: width < 950
          ? AppBar(
              backgroundColor: brownColor,
              iconTheme: const IconThemeData(color: secondaryBg),
            )
          : PreferredSize(
              preferredSize: Size(width, 60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: AppBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  backgroundColor: brownColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuButton(
                        onPressed: () {
                          scrollController.animateTo(
                              duration: const Duration(milliseconds: 200),
                              scrollController.position.minScrollExtent,
                              curve: Curves.decelerate);
                        },
                        title: "Home",
                      ),
                      MenuButton(
                        onPressed: () {
                          scrollController.animateTo(
                              duration: const Duration(milliseconds: 200),
                              height,
                              curve: Curves.decelerate);
                        },
                        title: "About",
                      ),
                      MenuButton(
                        onPressed: () {
                          scrollController.animateTo(
                              duration: const Duration(milliseconds: 200),
                              height * 1.9,
                              curve: Curves.decelerate);
                        },
                        title: "Services",
                      ),
                      MenuButton(
                        onPressed: () {},
                        title: "Projects",
                      ),
                      MenuButton(
                        onPressed: () {},
                        title: "Experience",
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(greyColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12)))),
                        onPressed: () async {
                          final url = Uri.parse(
                              "https://drive.google.com/file/d/1HAaKhzjC8Pt3cqq89pP77T65VpgfDnvC/view?usp=sharing");

                          if (await canLaunchUrl(url)) await launchUrl(url);
                        },
                        child: Text(
                          "Resume",
                          style: GoogleFonts.ibmPlexMono(
                              fontSize: 14, color: primaryBg),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
      body: ListView(
        controller: scrollController,
        children: [
          // Home
          ScreenTypeLayout.builder(
            mobile: (context) => const HomeMobileWidget(),
            desktop: (context) => const HomeDesktopWidget(),
          ),

          // About
          ScreenTypeLayout.builder(
            mobile: (context) => const AboutMobileWidget(),
            tablet: (context) => const AboutMobileWidget(),
            desktop: (context) => const AboutDesktopWidget(),
          ),

          // Service
          ScreenTypeLayout.builder(
            mobile: (context) => const ServiceMobileWidget(),
            tablet: (context) => const ServiceMobileWidget(),
            desktop: (context) => const ServiceDesktopWidget(),
          ),

          // Projects

          ScreenTypeLayout.builder(
            mobile: (context) => const ProjectMobileWidget(),
            tablet: (context) => const ProjectDesktopWidget(),
            desktop: (context) => const ProjectDesktopWidget(),
          ),
        ],
      ),
    );
  }
}

