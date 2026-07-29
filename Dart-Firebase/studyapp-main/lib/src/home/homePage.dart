import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:studyapp/src/userprofile/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app bar'),
      ),
      drawer: MyDrawer(
        onProfileTap: () {
          Navigator.pushNamed(context, '/profile');
        },
        onsignOut: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(
              context, '/signup', (route) => false);
        },
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Add your body content here
        ],
      ),
    );
  }
}
