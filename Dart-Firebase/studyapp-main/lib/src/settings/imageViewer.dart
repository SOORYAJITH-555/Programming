import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final ImageProvider image;
  final String name;
  const ImageViewer({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // Adjust the radius for curved corners
            child: Image(
              image: image,
              width: 210, // Set width as per your requirement
              height: 250, // Set height as per your requirement
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF2C2C5E),
              fontFamily: 'Poppins',
              letterSpacing: 1.5,
              height: 1,
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
