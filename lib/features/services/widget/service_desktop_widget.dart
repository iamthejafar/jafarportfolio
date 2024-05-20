import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';




class ServiceDesktopWidget extends StatelessWidget {
  const ServiceDesktopWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        color: secondaryBg,
        height: height,
        width: width,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What I can do ?",
              style: GoogleFonts.rajdhani(
                fontSize: 34,
                fontWeight: FontWeight.w400,
                color: skyBlueColor,
              ),
            ),
            Gap(20),
            SizedBox(
              height: height * 0.40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: width* 0.1,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: FlipCard(
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               SizedBox(
                                 height: height * 0.3,
                                   child: Image.asset("assets/animations/mobile.gif",fit: BoxFit.fitHeight,)
                               ),

                              Gap(10),
                              Text("Mobile App Development",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 16, color: brownColor, fontWeight: FontWeight.w600),),
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("• Flutter",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: secondaryBg),),
                              Text("• Kotlin",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: secondaryBg),),
                              Text("• Jetpack Compose",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: secondaryBg),),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width* 0.05,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: FlipCard(
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: height * 0.3,
                                  child: Image.asset("assets/animations/backend.gif")),

                              Gap(10),
                              Text("Backend Development",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 16, color: secondaryBg, fontWeight: FontWeight.w600),),
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("• Node.js",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: brownColor),),
                              Text("• Firebase",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: brownColor),),
                              Text("• AWS",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: brownColor),),
                              Text("• GCP",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: brownColor),),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width* 0.05,),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: FlipCard(
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: height * 0.3,
                                  child: Image.asset("assets/animations/web.gif")),

                              Gap(10),
                              Text("Web Development",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 16, color: brownColor, fontWeight: FontWeight.w600),),
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
                                    spreadRadius: 2
                                )
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text("• Flutter",style: GoogleFonts.ibmPlexMono(
                                  fontSize: 20, color: secondaryBg),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width* 0.1,),
                ],
              ),
            )
          ],
        ),);
  }
}
