import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:jafarportfolio/core/theme/colors.dart';


class ContactMeMobileWidget extends StatefulWidget {
  const ContactMeMobileWidget({super.key});

  @override
  State<ContactMeMobileWidget> createState() => _ContactMeMobileWidgetState();
}

class _ContactMeMobileWidgetState extends State<ContactMeMobileWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              "Contact Me",
              style: GoogleFonts.raleway(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: secondaryBg,
              ),
            ),
            const Gap(20),
            TextFormField(
              controller: _nameController,
              style: GoogleFonts.ibmPlexMono(
                  fontSize: 16, fontWeight: FontWeight.w700, color: brownColor),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.poppins(color: secondaryBg),
                filled: true,
                hintText: 'Name',
                fillColor: secondaryBg,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: lightGreenColor,
                    )),
                hintStyle: GoogleFonts.ibmPlexMono(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const Gap(20),
            TextFormField(
              controller: _emailController,
              style: GoogleFonts.ibmPlexMono(
                  fontSize: 16, fontWeight: FontWeight.w700, color: brownColor),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.poppins(color: secondaryBg),
                filled: true,
                hintText: 'Email',
                fillColor: secondaryBg,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreenColor)),
                hintStyle: GoogleFonts.ibmPlexMono(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const Gap(20),
            TextFormField(
              controller: _messageController,
              style: GoogleFonts.ibmPlexMono(
                  fontSize: 16, fontWeight: FontWeight.w700, color: brownColor),
              decoration: InputDecoration(
                errorStyle: GoogleFonts.poppins(color: secondaryBg),
                filled: true,
                hintText: 'Message',
                fillColor: secondaryBg,
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: lightGreenColor)),
                hintStyle: GoogleFonts.ibmPlexMono(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor),
              ),
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(lightBlueColor),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)))),
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  // Form is valid, proceed with sending email
                  _submitForm();
                }
              },
              child: Text(
                "Submit",
                style: GoogleFonts.ibmPlexMono(fontSize: 14, color: primaryBg),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    const serviceId = 'gmailService';
    const templateId = 'portfolio_template';
    const userId = 'Bq-zPCpra1coHvDvS';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'email': email,
          'message': message,
        },
      }),
    );

    if (response.statusCode == 200) {
      if(context.mounted){
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
        AnimatedSnackBar.rectangle(
          'Success',
          'Message successfully sent !',
          type: AnimatedSnackBarType.success,
          brightness: Brightness.light,
        ).show(
          context,
        );
      }
    } else {
      if(context.mounted){
        AnimatedSnackBar.rectangle(
          'Error',
          'Something went wrong.',
          type: AnimatedSnackBarType.error,
          brightness: Brightness.dark,
        ).show(
          context,
        );
      }
    }
  }


}

