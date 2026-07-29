import 'dart:ui';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    double containerHeight = screenSize.height * 0.3;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('hello'),
        flexibleSpace: Container(
            height: containerHeight,
            decoration: BoxDecoration(
                // Add your decoration properties here
                color: Colors.red)),
      ),
    );
  }
}
