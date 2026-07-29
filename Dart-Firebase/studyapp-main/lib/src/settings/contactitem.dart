import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studyapp/src/settings/icondata.dart';

class Contactitem extends StatelessWidget {
  final String contactName;
  final String email;
  final String phoneNumber;
  final String website;
  final String githubUserName;
  final String linkedinURL;
  final String tagLine;

  const Contactitem({
    required this.contactName,
    required this.email,
    required this.phoneNumber,
    required this.website,
    required this.githubUserName,
    required this.linkedinURL,
    required this.tagLine,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 1; // 90% of the screen width
    double containerHeight = screenSize.height * 1;
    return Container(
        alignment: Alignment.topLeft,
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ],
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color.fromRGBO(16, 206, 222, 100), Colors.lightBlue],
          ),
          borderRadius: const BorderRadius.only(),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Get in touch',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'MontserratAlternates'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Chat to us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5,
                    height: 1,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Our friendly team here to help you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                email,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Call us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5,
                    height: 1,
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Mon - fri ,from 8am to 5pm',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  letterSpacing: 1,
                  height: 1.5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text('Social Media',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5,
                    height: 1,
                  )),
              const SizedBox(
                height: 5,
              ),
              const Icondata(
                iconData: FontAwesomeIcons.instagram,
                text: 'sijil george illickal',
              ),
              const SizedBox(
                height: 5,
              ),
              const Icondata(
                iconData: FontAwesomeIcons.github,
                text: 'sijilgeorge',
              ),
              const SizedBox(
                height: 5,
              ),
              const Icondata(
                iconData: FontAwesomeIcons.linkedin,
                text: 'www.linkedin.com/in/Sijil George',
              ),
            ])));
  }
}
