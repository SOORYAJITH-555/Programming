import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:studyapp/src/onboarding/OnboardingView.dart';
import 'package:studyapp/src/widgets/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, Snapshot) {
            if (Snapshot.hasData) {
              return const Home();
            } else {
              return const OnboardingView();
            }
          }),
    );
  }
}
