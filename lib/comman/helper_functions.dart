import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

openResume() async {
  String urlString = "";
  try {
    final storageRef =
        FirebaseStorage.instance.ref().child("resume/Jafar_resume.pdf");
    urlString = await storageRef.getDownloadURL();
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) await launchUrl(url);
  } catch (e) {
    if (kDebugMode) {
      print('Error getting download URL: $e');
    }
  }
}
