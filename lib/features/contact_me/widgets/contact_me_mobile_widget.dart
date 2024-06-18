import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:jafarportfolio/core/theme/colors.dart';

import '../../../comman/widgets/custome_text_field.dart';


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

  bool isLoading = false;

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
            CustomTextField(
              nameController: _nameController,
              hintText: "Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const Gap(20),
            CustomTextField(
              nameController: _emailController,
              hintText: "Email",
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
            CustomTextField(
              nameController: _messageController,
              hintText: "Message",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (_formKey.currentState?.validate() ?? false) {
                            setState(() => isLoading = true);
                            await _submitForm();
                            setState(() => isLoading = false);
                          }
                        }
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
                        child: isLoading
                            ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: brownColor,
                            ))
                            : Text(
                          "Submit",
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
    );
  }

  Future _submitForm() async {
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

