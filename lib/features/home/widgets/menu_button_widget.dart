import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/colors.dart';




class MenuButton extends StatefulWidget {
  const MenuButton({super.key, required this.title, required this.onPressed, this.showUnderLine = false});

  final String title;
  final void Function() onPressed;
  final bool showUnderLine;
  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (value) {
          setState(() {
            isHovering = true;
          });
        },
        onExit: (value) {
          setState(() {
            isHovering = false;
          });
        },
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.title,
            style: GoogleFonts.ibmPlexMono(
                fontSize: 18,
                color: greyColor,
                decorationColor: greyColor,
                decoration: widget.showUnderLine ? TextDecoration.underline : isHovering
                    ? TextDecoration.underline
                    : TextDecoration.none),
          ),
        ),
    );
  }
}
