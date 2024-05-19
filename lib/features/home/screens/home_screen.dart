import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jafarportfolio/features/about/widget/about_mobile_widget.dart';
import 'package:jafarportfolio/features/home/widgets/home_mobile_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart';

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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: brownColor,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuButton(
                onPressed: () {},
                title: "Home",
              ),
              MenuButton(
                onPressed: () {},
                title: "About",
              ),
              MenuButton(
                onPressed: () {},
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
            ],
          ),
        ),
      ),
      backgroundColor: primaryBg,
      appBar: width < 950
          ? AppBar(
              backgroundColor: brownColor,
              iconTheme: IconThemeData(color: secondaryBg),
            )
          : PreferredSize(
              preferredSize: Size(width, 60),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: AppBar(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  backgroundColor: brownColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MenuButton(
                        onPressed: () {},
                        title: "Home",
                      ),
                      MenuButton(
                        onPressed: () {},
                        title: "About",
                      ),
                      MenuButton(
                        onPressed: () {},
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
                      ElevatedButton(onPressed: () {}, child: Text("Resume"))
                    ],
                  ),
                ),
              ),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Home
            ScreenTypeLayout.builder(
              mobile: (context) => HomeMobileWidget(),
              desktop: (context) => HomeDesktopWidget(),
            ),

            // About
            ScreenTypeLayout.builder(
              mobile: (context) => AboutMobileWidget(),
              tablet: (context) => AboutMobileWidget(),
              desktop: (context) => AboutDesktopWidget(),
            ),

            // Service

            Container(
              height: height,
              width: width,
              child: PageView(
                children: [
                  
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}

