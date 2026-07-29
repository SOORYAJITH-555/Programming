import 'package:flutter/material.dart';

import 'package:studyapp/src/settings/contactitem.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: const Contactitem(
        // Replace 'logo.png' with your app logo
        email: 'sijilgeorge18@gmail.com',

        phoneNumber: '8129015793',
        website: 'https://www.example.com',
        githubUserName: 'your_github_username',
        linkedinURL: 'https://www.linkedin.com/in/your-linkedin-profile',
        tagLine: 'Contact us for more information', contactName: 'sijil',
      ),
    );
  }
}
