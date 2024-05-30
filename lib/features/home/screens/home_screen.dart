import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/constants.dart';
import 'package:jafarportfolio/features/about/widget/about_mobile_widget.dart';
import 'package:jafarportfolio/features/contact_me/widgets/contact_me_mobile_widget.dart';
import 'package:jafarportfolio/features/experience/widget/experience_mobile_widget.dart';
import 'package:jafarportfolio/features/home/widgets/home_mobile_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_desktop_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_mobile_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_tablet_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_desktop_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_mobile_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_tablet_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../about/widget/about_desktop_widget.dart';
import '../../contact_me/widgets/contact_me_desktop_widget.dart';
import '../../experience/widget/experience_desktop_widget.dart';
import '../widgets/home_desktop_widget.dart';
import '../widgets/menu_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
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
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      scrollController.position.minScrollExtent,
                      curve: Curves.decelerate);
                },
                title: "Home",
              ),
              MenuButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      height * 0.4,
                      curve: Curves.decelerate);
                },
                title: "About",
              ),
              MenuButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      height * 1.2,
                      curve: Curves.decelerate);
                },
                title: "Services",
              ),
              MenuButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      height * 1.9,
                      curve: Curves.decelerate);
                },
                title: "Projects",
              ),
              MenuButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      height * 2.6,
                      curve: Curves.decelerate);
                },
                title: "Experience",
              ),
              MenuButton(
                onPressed: () async {
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      scrollController.position.maxScrollExtent,
                      curve: Curves.decelerate);
                },
                title: "Contact Me",
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(greyColor),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)))),
                  onPressed: () async {
                    final url = Uri.parse(resumeString);
                    if (await canLaunchUrl(url)) await launchUrl(url);
                  },
                  child: Text(
                    "Resume",
                    style:
                        GoogleFonts.ibmPlexMono(fontSize: 14, color: primaryBg),
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
              )
            ),
      body: Stack(
        children: [
          ListView(
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
                tablet: (context) => const ServiceTabletWidget(),
                desktop: (context) => const ServiceDesktopWidget(),
              ),

              // Projects

              ScreenTypeLayout.builder(
                mobile: (context) => ProjectMobileWidget(pageController: pageController,),
                tablet: (context) => ProjectTabletWidget(pageController: pageController,),
                desktop: (context) => ProjectDesktopWidget(pageController: pageController,),
              ),

              // Experience
              ScreenTypeLayout.builder(
                mobile: (context) => const ExperienceMobileWidget(),
                tablet: (context) => const ExperienceDesktopWidget(),
                desktop: (context) => const ExperienceDesktopWidget(),
              ),

              // Contact Me
              ScreenTypeLayout.builder(
                mobile: (context) => const ContactMeMobileWidget(),
                tablet: (context) => const ContactMeMobileWidget(),
                desktop: (context) => const ContactMeDesktopWidget(),
              ),

              Gap(50),
              Center(
                child: Text(
                  "Developed in Flutter with ❤️",
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ),
              Gap(10)
            ],
          ),
          if(width > 950)
            Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: brownColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        scrollController.position.minScrollExtent,
                        curve: Curves.decelerate);
                  },
                  title: "Home",
                ),
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        height,
                        curve: Curves.decelerate);
                  },
                  title: "About",
                ),
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        height * 1.9,
                        curve: Curves.decelerate);
                  },
                  title: "Services",
                ),
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        height * 2.6,
                        curve: Curves.decelerate);
                  },
                  title: "Projects",
                ),
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        height * 3.5,
                        curve: Curves.decelerate);
                  },
                  title: "Experience",
                ),
                MenuButton(
                  onPressed: () async {
                    await scrollController.animateTo(
                        duration: const Duration(seconds: 1),
                        scrollController.position.maxScrollExtent,
                        curve: Curves.decelerate);
                  },
                  title: "Contact Me",
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      const WidgetStatePropertyAll(greyColor),
                      shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)))),
                  onPressed: () async {
                    final url = Uri.parse(resumeString);
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
        ],
      ),
    );
  }
}
