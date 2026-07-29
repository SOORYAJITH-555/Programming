// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  static const List<Map<String, String>> courseList = [
    {"index": "C", "image": "images/C.jpg"},
    {"index": "C++", "image": "images/C++.jpg"},
    {"index": "Python", "image": "images/Python.jpg"},
    {"index": "Java", "image": "images/Java.jpg"},
    {"index": "HTML", "image": "images/HTML.jpg"},
    {"index": "Ruby", "image": "images/Ruby.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          elevation: 4.0,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          toolbarHeight: 80,
          title: const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Courses",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print("Container ${courseList[index]['index']} pressed");
                    switch (courseList[index]['index']) {
                      case 'C':
                        Navigator.pushNamed(context, '/cprogram');
                        break;
                      case 'C++':
                        Navigator.pushNamed(context, '/comingsoon');
                        break;
                      case 'Python':
                        Navigator.pushNamed(context, '/comingsoon');
                        break;
                      case 'Java':
                        Navigator.pushNamed(context, '/comingsoon');
                        break;
                      case 'HTML':
                        Navigator.pushNamed(context, '/comingsoon');
                        break;
                      case 'Ruby':
                        Navigator.pushNamed(context, '/comingsoon');
                        break;

                      default:
                        print(
                            "No action defined for ${courseList[index]['index']}");
                    }
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 0, left: 10, right: 10),
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 25),
                                    child: Image.asset(
                                      courseList[index]['image']!,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      courseList[index]['index']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
