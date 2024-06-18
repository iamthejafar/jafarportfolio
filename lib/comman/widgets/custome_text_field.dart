import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/colors.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required TextEditingController nameController, this.hintText, this.validator, this.maxLines,
  }) : textController = nameController;

  final TextEditingController textController;
  final String? hintText;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        maxLines: maxLines,
        controller: textController,
        style: GoogleFonts.ibmPlexMono(
            fontSize: 16, fontWeight: FontWeight.w700, color: secondaryBg),
        decoration: InputDecoration(
          errorStyle: GoogleFonts.poppins(color: secondaryBg),
          filled: true,
          hintText: hintText,
          fillColor: brownColor,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: lightGreenColor
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: brownColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: lightGreenColor
              )
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: brownColor
              )
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: brownColor
              )
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: brownColor
              )
          ),
          hintStyle: GoogleFonts.ibmPlexMono(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: greyColor),
        ),
        validator: validator
    );
  }
}
