import 'package:flutter/material.dart';

class Icondata extends StatelessWidget {
  final IconData iconData;
  final String text;

  const Icondata({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 22,
          color: Colors.white,
        ),
        SizedBox(width: 10), // Add some spacing between the icon and text
        Text(
          text, // Text to display
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Poppins',
            letterSpacing: 1,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
