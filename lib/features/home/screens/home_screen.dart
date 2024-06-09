import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/constants.dart';
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
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../about/widget/about_desktop_widget.dart';
import '../../contact_me/widgets/contact_me_desktop_widget.dart';
import '../../experience/widget/experience_desktop_widget.dart';
import '../widgets/home_desktop_widget.dart';
import '../widgets/menu_button_widget.dart';
import '../widgets/threed_button.dart';

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
              ),
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
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
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
                  ),
                  // SizedBox(
                  //
                  //   width : 200,child: ThreeDButton(),)

                ],
              ),
            ),
        ],
      ),
    );
  }
}


class CustomAnimatedGrid extends HookWidget {
  const CustomAnimatedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final hoveredIndex = useState<int?>(null); // State to track hovered index

    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-1) // Tilt the grid view slightly around the X axis
          ..rotateY(0)
        ..rotateZ(0), // Tilt the grid view slightly around the Y axis
        alignment: FractionalOffset.center,
        child: SizedBox(
          height: height,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 20,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              return HoverAnimatedGridItem(
                index: index,
                hoveredIndex: hoveredIndex,
              );
            },
            itemCount: 200,
          ),
        ),
      ),
    );
  }
}

class HoverAnimatedGridItem extends HookWidget {
  final int index;
  final ValueNotifier<int?> hoveredIndex;

  const HoverAnimatedGridItem({
    super.key,
    required this.index,
    required this.hoveredIndex,
  });

  bool isNearby(int currentIndex, int hoveredIndex, int crossAxisCount, int range) {
    int currentRow = currentIndex ~/ crossAxisCount;
    int currentColumn = currentIndex % crossAxisCount;
    int hoveredRow = hoveredIndex ~/ crossAxisCount;
    int hoveredColumn = hoveredIndex % crossAxisCount;

    return (currentRow - hoveredRow).abs() <= range && (currentColumn - hoveredColumn).abs() <= range;
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = hoveredIndex.value != null && isNearby(index, hoveredIndex.value!, 20, 1);
    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        onEnter: (_) => hoveredIndex.value = index,
        onExit: (_) => hoveredIndex.value = null,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: isHovered
              ? (Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(0)
            ..rotateY(0)
            ..rotateZ(0)
            ..translate(0.0, -5.0, -20.0)) // Move the item up
              : Matrix4.identity(),
          decoration: BoxDecoration(
            border: Border.all(color: brownColor),
            gradient: isHovered
                ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [greyColor, Colors.grey],
            )
                : null,
            color: isHovered ? null : Colors.transparent,
            boxShadow: isHovered
                ? [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                offset: Offset(20, 20),
                blurRadius: 20,
              ),
            ]
                : [],
          ),
          margin: EdgeInsets.all(3),
          child: Center(
            child: SizedBox(),
          ),
        ),
      ),
    );
  }
}
