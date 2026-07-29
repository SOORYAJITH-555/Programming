import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBox extends StatelessWidget {
  final IconData iconData;
  final String text;
  final String sectionname;

  var onpressd;

  TextBox(
      {super.key,
      required this.text,
      required this.sectionname,
      required this.iconData,
      required this.onpressd});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                        10.0), // Padding around the outer circle
                    decoration: BoxDecoration(
                      shape:
                          BoxShape.circle, // Shape of the container (circular)
                      color: Colors.grey[300], // Color of the outer circle
                    ),
                    child: CircleAvatar(
                      backgroundColor:
                          Colors.white, // Color of the inner circle
                      radius: 30, // Radius of the inner circle
                      child: Icon(
                        iconData, // Using the built-in school icon
                        size: 30, // Size of the icon
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sectionname,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                            )),
                        Text(text,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 20))
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onpressd,
                icon: const Icon(Icons.settings),
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
