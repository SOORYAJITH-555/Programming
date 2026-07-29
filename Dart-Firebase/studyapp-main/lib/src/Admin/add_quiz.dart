// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:studyapp/src/Admin/database.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({super.key});

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  uploadItem() async {
    if (questioncontroller.text.isEmpty ||
        option1controller.text.isEmpty ||
        option2controller.text.isEmpty ||
        option3controller.text.isEmpty ||
        option4controller.text.isEmpty ||
        correctcontroller.text.isEmpty ||
        detailscontroller.text.isEmpty ||
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
        "Option1": option1controller.text,
        "Option2": option2controller.text,
        "Option3": option3controller.text,
        "Option4": option4controller.text,
        "Correct": correctcontroller.text,
        "Details": detailscontroller.text,
      };

      // await DatabaseMethods().addQuizCategory(addQuiz, value!).then((value){
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     backgroundColor: Colors.orange,
      //     content: Text(
      //     "Quiz has been added Successfully",
      //     style: TextStyle(
      //       fontSize: 18,
      //     ),
      //     )
      //   ));
      // });

      try {
        await DatabaseMethods().addQuizCategory(addQuiz, value!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            "Quiz has been added Successfully",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ));
        questioncontroller.clear();
        option1controller.clear();
        option2controller.clear();
        option3controller.clear();
        option4controller.clear();
        correctcontroller.clear();
        detailscontroller.clear();
        setState(() {
          value = null; // Reset dropdown value
        });
      } catch (error) {
        print("Error adding quiz: $error");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Failed to add quiz. Please try again.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ));
      }
    }
  }

  String? value;
  final List<String> category = [
    'Quiz',
    'Aptitude',
  ];

  TextEditingController questioncontroller = new TextEditingController();
  TextEditingController option1controller = new TextEditingController();
  TextEditingController option2controller = new TextEditingController();
  TextEditingController option3controller = new TextEditingController();
  TextEditingController option4controller = new TextEditingController();
  TextEditingController correctcontroller = new TextEditingController();
  TextEditingController detailscontroller = new TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'Add Quiz',
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
                'Option 1',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                  controller: option1controller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Option 1',
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
                'Option 2',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                  controller: option2controller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Option 2',
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
                'Option 3',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                  controller: option3controller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Option 3',
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
                'Option 4',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                  controller: option4controller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Option 4',
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
                'Correct Answer',
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
                  controller: correctcontroller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter correct answer',
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
                'Answer Details',
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
                  controller: detailscontroller,
                  maxLines: null, // Set maxLines to null for multiline input
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter answer details',
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
                'Choose the topic',
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
