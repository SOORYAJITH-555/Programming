// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/src/Admin/database.dart';

class Question extends StatefulWidget {
  String category;
  Question({required this.category});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool showDetails = false;
  String? details;
  bool show = false;

  getontheload() async {
    quizStream = await DatabaseMethods().getCategoryQuiz(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Stream? quizStream;
  PageController controller = PageController();

  Widget allQuiz() {
    return StreamBuilder(
      stream: quizStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? PageView.builder(
                controller: controller,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                ds["Question"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ds["Correct"] ==
                                                        ds["Option1"]
                                                    ? Colors.green
                                                    : Colors.red,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option1"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option1"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ds["Correct"] ==
                                                        ds["Option2"]
                                                    ? Colors.green
                                                    : Colors.red,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option2"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option2"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ds["Correct"] ==
                                                        ds["Option3"]
                                                    ? Colors.green
                                                    : Colors.red,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option3"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option3"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                onTap: () {
                                  show = true;
                                  setState(() {});
                                },
                                child: show
                                    ? Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ds["Correct"] ==
                                                        ds["Option4"]
                                                    ? Colors.green
                                                    : Colors.red,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option4"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(10),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          ds["Option4"],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = false;
                                    details = null;
                                  });
                                  controller.previousPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Toggle the value of showDetails
                                    showDetails = !showDetails;
                                    // Fetch and store details if showDetails is true
                                    if (showDetails) {
                                      details = ds["Details"] as String?;
                                    } else {
                                      details =
                                          null; // Reset details when hiding
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Text(
                                    showDetails
                                        ? "Hide Details"
                                        : "Show Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    show = false;
                                    details = null;
                                  });

                                  controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          showDetails && details != null
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: RichText(
                                        text: TextSpan(
                                          text: details?.replaceAll("  ",
                                              "\n"), // Replace double space with newline (if needed)
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                })
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  widget.category,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: allQuiz()),
        ],
      ),
    );
  }
}
