import 'package:flutter/material.dart';
import 'package:studyapp/src/authentication/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double containerWidth = screenSize.width * 1;
    double containerHeight = screenSize.height * 1;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: const Text(
            "Job-PrepTool",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white, // Set your text color
              fontSize: 60,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
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

            gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color.fromRGBO(16, 206, 222, 100), Colors.lightBlue]),
          )),
    );
  }
}
