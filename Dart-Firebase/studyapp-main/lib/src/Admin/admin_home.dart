// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  static const List<Map<String, String>> topicList = [
    {"index": "Quiz", "image": "images/Quiz.png"},
    {"index": "Interview", "image": "images/Interview.jpg"},
  ];

  @override
  State<AdminHome> createState() => _HomeState();
}

class _HomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Transform.translate(
                    offset: Offset(0, -30),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 305,
                        width: containerWidth,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(221, 0, 0, 0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(70)),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-35, -35),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-25, 90),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(60, -50),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(280, -50),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(210, 100),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 180),
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
                                      Text(
                                        'Feedback',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Text(
                                          'User reviews \nabout the app',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/feedback');
                                          },
                                          child: Text(
                                            'See Now',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Image.asset(
                                    'images/C#.png',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 27,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'JobPrepTool',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/admin_login');
                        },
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
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
                    'Features',
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
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    print(
                        "Container ${AdminHome.topicList[index]['index']} pressed");
                    switch (AdminHome.topicList[index]['index']) {
                      case 'Quiz':
                        Navigator.pushNamed(context, '/add_quiz');
                        break;
                      case 'Interview':
                        Navigator.pushNamed(context, '/add_interview');
                        break;

                      default:
                        print(
                            "No action defined for ${AdminHome.topicList[index]['index']}");
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
                                      AdminHome.topicList[index]['image']!,
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
                                      AdminHome.topicList[index]['index']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
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
