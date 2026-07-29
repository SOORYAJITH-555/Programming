// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:studyapp/src/Quiz/interQuestion.dart';

class Interview extends StatefulWidget {
  const Interview({super.key});

  static const List<Map<String, String>> interviewList = [
    {"index": "Technical Interview", "image": "images/technical.jpg"},
    {"index": "HR Interview", "image": "images/hr.jpg"},
  ];

  @override
  State<Interview> createState() => _InterviewState();
}

class _InterviewState extends State<Interview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4.0,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "Interview",
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
      body: GridView.builder(
        itemCount: 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.2),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print(
                "Container ${Interview.interviewList[index]['index']} pressed");
            switch (Interview.interviewList[index]['index']) {
              case 'Technical Interview':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InterQuestion(category: "Technical_Interview"),
                    ));
                break;
              case 'HR Interview':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InterQuestion(category: "HR_Interview"),
                    ));
                break;

              default:
                print(
                    "No action defined for ${Interview.interviewList[index]['index']}");
            }
          },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 0, left: 10, right: 10),
                child: Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 15),
                            child: Image.asset(
                              Interview.interviewList[index]['image']!,
                              height: 400,
                              width: 400,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              Interview.interviewList[index]['index']!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
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
    );
  }
}
