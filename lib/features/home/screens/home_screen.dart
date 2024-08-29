import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:jafarportfolio/comman/helper_functions.dart';
import 'package:jafarportfolio/features/about/widget/about_mobile_widget.dart';
import 'package:jafarportfolio/features/contact_me/widgets/contact_me_mobile_widget.dart';
import 'package:jafarportfolio/features/experience/widget/experience_mobile_widget.dart';
import 'package:jafarportfolio/features/home/widgets/home_mobile_widget.dart';
import 'package:jafarportfolio/features/home/widgets/home_tablet_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_desktop_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_mobile_widget.dart';
import 'package:jafarportfolio/features/project/widgets/project_tablet_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_desktop_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_mobile_widget.dart';
import 'package:jafarportfolio/features/services/widget/service_tablet_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
              child: InkWell(
                child: SizedBox(
                    height: 55,
                    width: 50,
                    child: Image.asset("assets/images/logo.png")),
                onTap: () async {
                  if(context.mounted)  Navigator.of(context).pop();
                  await scrollController.animateTo(
                      duration: const Duration(seconds: 1),
                      scrollController.position.minScrollExtent,
                      curve: Curves.decelerate);
                },
              ),
            ),
            DrawerListTile(
              title: "Home",
              iconData: Icons.house,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    scrollController.position.minScrollExtent,
                    curve: Curves.decelerate);
              },
            ),
            DrawerListTile(
              title: "About",
              iconData: CupertinoIcons.person_fill,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    height * 0.4,
                    curve: Curves.decelerate);
              },
            ),
            DrawerListTile(
              title: "Services",
              iconData: CupertinoIcons.briefcase_fill,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    height * 1.1,
                    curve: Curves.decelerate);
              },
            ),
            DrawerListTile(
              title: "Projects",
              iconData: CupertinoIcons.wrench_fill,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    height * 1.9,
                    curve: Curves.decelerate);
              },
            ),
            DrawerListTile(
              title: "Experience",
              iconData: CupertinoIcons.gear_solid,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    height * 2.6,
                    curve: Curves.decelerate);
              },
            ),
            DrawerListTile(
              title: "Contact Me",
              iconData: CupertinoIcons.mail_solid,
              onTap: () async {
                if(context.mounted)  Navigator.of(context).pop();
                await scrollController.animateTo(
                    duration: const Duration(seconds: 1),
                    scrollController.position.maxScrollExtent,
                    curve: Curves.decelerate);
              },
            ),

            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 40,
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () async {
                          await openResume();
                        },
                        child: HoverAnimatedContainer(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: greyColor,
                          ),
                          hoverDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: greyColor,
                          ),
                          height: 30,
                          hoverHeight: 35,
                          width: 100,
                          hoverWidth: 105,
                          alignment: Alignment.center,
                          child: Text(
                            "Resume",
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 14, color: primaryBg),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: primaryBg,
      appBar: width < 950
          ? AppBar(
              backgroundColor: brownColor,
              iconTheme: const IconThemeData(color: secondaryBg),
              toolbarHeight: 80,
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: InkWell(
                    child: SizedBox(
                        height: 55,
                        width: 50,
                        child: Image.asset("assets/images/logo.png")),
                    onTap: () async {
                      await scrollController.animateTo(
                          duration: const Duration(seconds: 1),
                          scrollController.position.minScrollExtent,
                          curve: Curves.decelerate);
                    },
                  ),
                ),
              ],
            )
          : PreferredSize(
              preferredSize: Size(width, 60),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
              )),
      body: Stack(
        children: [
          ListView(
            controller: scrollController,
            children: [
              // Home
              ScreenTypeLayout.builder(
                mobile: (context) => const HomeMobileWidget(),
                desktop: (context) => const HomeDesktopWidget(),
                tablet: (context) => const HomeTabletWidget(),
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
                mobile: (context) => ProjectMobileWidget(
                  pageController: pageController,
                ),
                tablet: (context) => ProjectTabletWidget(
                  pageController: pageController,
                ),
                desktop: (context) => ProjectDesktopWidget(
                  pageController: pageController,
                ),
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

              const Gap(50),
              Center(
                child: Text(
                  "Developed in Flutter with ❤️",
                  style: GoogleFonts.ibmPlexMono(
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ),
              const Gap(10)
            ],
          ),
          if (width > 950)
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: brownColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: SizedBox(
                        height: 65,
                        width: 60,
                        child: Image.asset("assets/images/logo.png")),
                    onTap: () async {
                      await scrollController.animateTo(
                          duration: const Duration(seconds: 1),
                          scrollController.position.minScrollExtent,
                          curve: Curves.decelerate);
                    },
                  ),
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
                          height * 1.7,
                          curve: Curves.decelerate);
                    },
                    title: "Services",
                  ),
                  MenuButton(
                    onPressed: () async {
                      await scrollController.animateTo(
                          duration: const Duration(seconds: 1),
                          height * 2.75,
                          curve: Curves.decelerate);
                    },
                    title: "Projects",
                  ),
                  MenuButton(
                    onPressed: () async {
                      await scrollController.animateTo(
                          duration: const Duration(seconds: 1),
                          height * 3.65,
                          curve: Curves.decelerate);
                    },
                    title: "Experience",
                  ),
                  MenuButton(
                    onPressed: () async {
                      await scrollController.animateTo(
                          duration: const Duration(seconds: 3),
                          scrollController.position.maxScrollExtent,
                          curve: Curves.decelerate);
                    },
                    title: "Contact Me",
                  ),
                  SizedBox(
                    height: 40,
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () async {
                              await openResume();
                            },
                            child: HoverAnimatedContainer(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: greyColor,
                              ),
                              hoverDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: greyColor,
                              ),
                              height: 30,
                              hoverHeight: 35,
                              width: 100,
                              hoverWidth: 105,
                              alignment: Alignment.center,
                              child: Text(
                                "Resume",
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 14, color: primaryBg),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconData,
    this.onTap,
  });

  final String title;
  final IconData iconData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: GoogleFonts.ibmPlexMono(
            fontSize: 18,
            color: greyColor,
            decorationColor: greyColor,
            decoration: TextDecoration.none),
      ),
      leading: Icon(iconData),
      iconColor: greyColor,
    );
  }
}


