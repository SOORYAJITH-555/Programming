// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/src/Quiz/question.dart';
import 'package:studyapp/src/userprofile/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const List<Map<String, String>> topicList = [
    {"index": "Courses", "image": "images/Courses.png"},
    {"index": "Quiz", "image": "images/Quiz.png"},
    {"index": "Aptitude", "image": "images/Aptitude.jpg"},
    {"index": "Interview", "image": "images/Interview.jpg"},
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 1;
    double containerHeight = screenSize.height * .2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      drawer: MyDrawer(onProfileTap: () {
        Navigator.pushNamed(context, '/profile');
      }, onsignOut: () {
        FirebaseAuth.instance.signOut();
        Navigator.pushNamedAndRemoveUntil(context, '/signup', (route) => false);
      }, contactus: () {
        Navigator.pushNamed(context, '/settings');
      }),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70)),
                      child: Container(
                          height: containerHeight,
                          width: containerWidth,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 3),
                              )
                            ],
                            // color: Colors.blue[600],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70)),
                            gradient: const LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color.fromRGBO(16, 206, 222, 100),
                                  Colors.lightBlue
                                ]),
                          )),
                    ),
                  ),

                  // Transform.translate(
                  //   offset: Offset(-25, -25),
                  //   child: Container(
                  //     width: 140,
                  //     height: 140,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),

                  // Transform.translate(
                  //   offset: Offset(-25, 90),
                  //   child: Container(
                  //     width: 100,
                  //     height: 100,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),

                  // Transform.translate(
                  //   offset: Offset(60, -50),
                  //   child: Container(
                  //     width: 120,
                  //     height: 120,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),

                  // Transform.translate(
                  //   offset: Offset(280, -50),
                  //   child: Container(
                  //     width: 150,
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),

                  // Transform.translate(
                  //   offset: Offset(210, 100),
                  //   child: Container(
                  //     width: 150,
                  //     height: 150,
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 70),
                    child: Text(
                      'Find Your Courses',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 115),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Material(
                        elevation: 7,
                        borderRadius: BorderRadius.circular(45),
                        child: Container(
                          width: 310,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                          'Especially for You',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Calculate your\n CGPA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/cgpa');
                                        },
                                        child: Text(
                                          'Click Here',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(16, 206, 222, 100),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'images/cgpa.png',
                                    height: 80,
                                    width: 80,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: IconButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/login');
                  //       },
                  //       icon: Icon(
                  //         Icons.arrow_back,
                  //         color: Colors.white,
                  //         size: 27,
                  //       )),
                  // ),

                  // Align(
                  //   alignment: Alignment.topRight,
                  //   child: IconButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/login');
                  //       },
                  //       icon: Icon(
                  //         Icons.person,
                  //         color: Colors.white,
                  //         size: 30,
                  //       )),
                  // ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Topics',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print(
                        "Container ${Home.topicList[index]['index']} pressed");
                    switch (Home.topicList[index]['index']) {
                      case 'Courses':
                        Navigator.pushNamed(context, '/courses');
                        break;
                      case 'Quiz':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Question(category: "Quiz"),
                            ));
                        break;
                      case 'Aptitude':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Question(category: "Aptitude"),
                            ));
                        break;
                      case 'Interview':
                        Navigator.pushNamed(context, '/interview');
                        break;

                      default:
                        print(
                            "No action defined for ${Home.topicList[index]['index']}");
                    }
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Material(
                          elevation: 7,
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0, bottom: 25),
                                    child: Image.asset(
                                      Home.topicList[index]['image']!,
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
                                      Home.topicList[index]['index']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}
