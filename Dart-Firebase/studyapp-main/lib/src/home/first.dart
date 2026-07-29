import 'package:flutter/material.dart';
import 'package:studyapp/src/login/Login1.dart';

class FirstApp extends StatefulWidget {
  @override
  State<FirstApp> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  void initstate() {
    Future.delayed(
      Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Set the container width and height based on screen size
    double containerWidth = screenSize.width * 1; // 90% of the screen width
    double containerHeight =
        screenSize.height * 0.6; // 60% of the screen height

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 102),
                    decoration: BoxDecoration(
                      color: Colors.blue, // Set your background color
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: containerWidth, // Set the width
                    height: containerHeight, // Set the height
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 23),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: const Text(
                            "Job-Prep\nTool",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white, // Set your text color
                              fontSize: 60,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
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
          Positioned(
            bottom: 260,
            right: -3,
            child: Container(
              height: 172,
              width: 220,
              decoration: const ShapeDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            bottom: 260,
            right: 217.5,
            child: Container(
              height: 172,
              width: 220,
              decoration: const ShapeDecoration(
                color: Colors.blue,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 150,
            bottom: 60,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to the second page when the button is clicked
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login1()),
                    ((route) => false));
              },
              child: const Text('Get Started'),
            ),
          ),
          const Positioned(
              left: 80,
              bottom: 130,
              child: SizedBox(
                width: 266,
                height: 113,
                child: Text(
                  'Easy and fast learning at \nany time to help you \nimprove various skills',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF858597),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
