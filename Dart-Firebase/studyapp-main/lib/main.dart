import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/src/Admin/add_interview.dart';
import 'package:studyapp/src/Admin/add_quiz.dart';
import 'package:studyapp/src/Admin/admin_home.dart';
import 'package:studyapp/src/Admin/admin_login.dart';

import 'package:studyapp/src/cgpa/Cgpa.dart';
import 'package:studyapp/src/feedback/feedback.dart' as MyAppFeedback;
import 'package:studyapp/src/home/splashScreen.dart';

import 'package:studyapp/src/login/Login1.dart';
import 'package:studyapp/src/login/SignUp.dart';
import 'package:studyapp/src/onboarding/OnboardingView.dart';
import 'package:studyapp/src/settings/SettingsPage.dart';
import 'package:studyapp/src/settings/aboutus.dart';
import 'package:studyapp/src/settings/contactUs.dart';

import 'package:studyapp/src/userprofile/profilePage.dart';
import 'package:studyapp/src/widgets/comingsoon.dart';
import 'package:studyapp/src/widgets/coures.dart';
import 'package:studyapp/src/widgets/cprogram.dart';
import 'package:studyapp/src/widgets/home.dart';
import 'package:studyapp/src/widgets/interview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyD-SonKlbUrlz_20wnuYA-6Nyf-CZvqPrw',
          appId: '1:110855516153:android:876bdf8a7dae9b8ec41728',
          messagingSenderId: '110855516153',
          projectId: 'flutter-project-7a364')); // Await initialization
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/login': (context) => const Login1(),
        '/signup': (context) => SignUp(),
        '/listview': (context) => const CProgram(),
        '/profile': (context) => const ProfilePage(),
        '/home': (context) => const Home(),
        '/courses': (context) => const Courses(),
        '/interview': (context) => const Interview(),
        '/cprogram': (context) => const CProgram(),
        '/contactus': (context) => const ContactUs(),
        '/settings': (context) => const SettingsPage(),
        '/contact': (context) => const ContactUs(),
        '/aboutus': (context) => const AboutUs(),
        '/onboard': (context) => const OnboardingView(),
        '/admin_login': (context) => const AdminLogin(),
        '/admin_home': (context) => const AdminHome(),
        '/add_quiz': (context) => const AddQuiz(),
        '/add_interview': (context) => const AddInterview(),
        '/feedback': (context) => const MyAppFeedback.Feedback(),
        '/cgpa': (context) => const Cgpa(title: 'C G P A'),
        '/comingsoon': (context) => const Comingsoon()
      },
    );
  }
}
