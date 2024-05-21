
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/colors.dart';
import '../../home/widgets/menu_button_widget.dart';


class ProjectMobileWidget extends StatelessWidget {
  const ProjectMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects",
            style: GoogleFonts.raleway(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: secondaryBg,
            ),
          ),
          Gap(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monify",
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: secondaryBg,
                          ),
                        ),
                        Text(
                          "An - Expense Tracker App",
                          style: GoogleFonts.ibmPlexMono(
                            fontSize: 16,
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
                            final url = Uri.parse("https://github.com/iamthejafar/monify");
                            if(await canLaunchUrl(url)){
                              await launchUrl(url);
                            }
                          }
                      ),
                      Gap(20),
                      MenuButton(
                          title: "Figma",
                          onPressed: () async {
                            final url = Uri.parse("https://www.figma.com/design/6RE8zrf0DAP7rXrVDzzD8z/Monify?node-id=2%3A117&t=jVPw98thbqBop4AT-1");
                            if(await canLaunchUrl(url)){
                            await launchUrl(url);
                            }
                          }
                      ),
                    ],
                  ),
                ],
              ),
              Gap(10),
              SizedBox(
                width: width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/monify.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
