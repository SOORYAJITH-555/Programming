// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:studyapp/src/Admin/database.dart';

class AddInterview extends StatefulWidget {
  const AddInterview({super.key});

  @override
  State<AddInterview> createState() => _AddInterviewState();
}

class _AddInterviewState extends State<AddInterview> {
  uploadItem() async {
    if (questioncontroller.text.isEmpty ||
        answercontroller.text.isEmpty ||
        value == null) {
      // Prompt the user about the empty field
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Please fill all fields",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ));
    } else {
      Map<String, dynamic> addQuiz = {
        "Question": questioncontroller.text,
        "Answer": answercontroller.text,
      };

      try {
        await DatabaseMethods().addQuizCategory(addQuiz, value!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            "Interview has been added Successfully",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ));
        questioncontroller.clear();
        answercontroller.clear();
        setState(() {
          value = null; // Reset dropdown value
        });
      } catch (error) {
        print("Error adding interview: $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Failed to add interview. Please try again.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ));
      }
    }
  }

  String? value;
  final List<String> category = ['HR_Interview', 'Technical_Interview'];

  TextEditingController questioncontroller = new TextEditingController();
  TextEditingController answercontroller = new TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Add Interview',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your Question ?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: questioncontroller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Question',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Enter your Answer',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  controller: answercontroller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter answer',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Choose the Category',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                  items: category
                      .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )))
                      .toList(),
                  onChanged: ((value) => setState(() {
                        this.value = value;
                      })),
                  dropdownColor: Colors.white,
                  hint: Text('Select Category'),
                  iconSize: 36,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  value: value,
                )),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
