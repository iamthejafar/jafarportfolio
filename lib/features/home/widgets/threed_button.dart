


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

import '../../../core/theme/colors.dart';


class ThreeDButton extends StatefulWidget {
  const ThreeDButton({super.key});

  @override
  State<ThreeDButton> createState() => _ThreeDButtonState();
}

class _ThreeDButtonState extends State<ThreeDButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
         return SizedBox(
           height: 50,
           child: GestureDetector(
                 onTap: () {},
                 child: MouseRegion(
                   onEnter: (_) => setState(()=>isHovered=true) ,
                   onExit: (_) => setState(()=>isHovered=false),
                   child: AnimatedContainer(
            height: 50,
            width: 100,
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
              borderRadius: BorderRadius.circular(10),
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
              child: Text(
                "Resume",
                style: GoogleFonts.ibmPlexMono(
                    fontSize: 14, color: primaryBg),
              ),
            ),
                   ),
                 ),
               ),
         );

  }
}
