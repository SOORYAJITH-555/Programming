import 'package:flutter/material.dart';
import 'package:studyapp/src/pageview/pageviews/PageView1.dart';
import 'package:studyapp/src/pageview/pageviews/PageView10.dart';
import 'package:studyapp/src/pageview/pageviews/PageView2.dart';
import 'package:studyapp/src/pageview/pageviews/PageView3.dart';
import 'package:studyapp/src/pageview/pageviews/PageView4.dart';
import 'package:studyapp/src/pageview/pageviews/PageView5.dart';
import 'package:studyapp/src/pageview/pageviews/PageView6.dart';
import 'package:studyapp/src/pageview/pageviews/PageView7.dart';
import 'package:studyapp/src/pageview/pageviews/PageView8.dart';
import 'package:studyapp/src/pageview/pageviews/PageView9.dart';

class CProgram extends StatelessWidget {
  const CProgram({Key? key}) : super(key: key);

  static const List<Map<String, String>> topics = [
    {"index": "01", "name": "Introduction"},
    {"index": "02", "name": "Basic Progarmming"},
    {"index": "03", "name": "Function"},
    {"index": "04", "name": "Preprocessor"},
    {"index": "05", "name": "Recursion"},
    {"index": "06", "name": "Arrays"},
    {"index": "07", "name": "Strings"},
    {"index": "08", "name": "Pointers"},
    {"index": "09", "name": "Structure"},
    {"index": "10", "name": "File"},
  ];

  static Map<String, Widget> topicPages = {
    "01": Pageview1(),
    "02": Pageview2(),
    "03": Pageview3(),
    "04": Pageview4(),
    "05": Pageview5(),
    "06": Pageview6(),
    "07": Pageview7(),
    "08": Pageview8(),
    "09": Pageview9(),
    "10": Pageview10(),
    // Add more mappings as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        elevation: 4.0,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "C Programming",
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
      body: SafeArea(
        child: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int index) {
            final topic = topics[index];
            return GestureDetector(
              onTap: () {
                String topicIndex = topic['index']!;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => topicPages[topicIndex] ?? Pageview1(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              topic['index']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          topic['name']!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
