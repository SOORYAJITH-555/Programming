import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:studyapp/src/pageview/CoursePageView.dart';
import 'package:studyapp/src/widgets/cprogram.dart';

class CourseScreen extends StatefulWidget {
  final List<List<Map<String, dynamic>>> courseContent;

  // ignore: use_super_parameters
  const CourseScreen({Key? key, required this.courseContent}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late PageController _pageController;
  int _currentIndex = 0; // Define currentIndex here

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    // Set the container width and height based on screen size
    double containerWidth = screenSize.width * 1; // 90% of the screen width

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.courseContent
                    .length, // Changed controler.items.length to courseContent.length
                effect: SlideEffect(
                  spacing: 5.0,
                  radius: 4.0,
                  dotWidth: containerWidth /
                      widget.courseContent
                          .length, // Changed controler.items.length to courseContent.length
                  dotHeight: 5,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: const Color(0xFF98B6ED),
                  activeDotColor: const Color(0xFF0E53E1),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onItemTapped,
              itemCount: widget.courseContent.length,
              itemBuilder: (BuildContext context, int index) {
                return CoursePageview(
                    courseContent: widget.courseContent[index]);
              },
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 5),
            color: const Color(0xFFF8F9FB),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: Icon(FontAwesomeIcons.multiply),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CProgram()),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                        _onItemTapped(_currentIndex - 1);
                      },
                    ),
                    const SizedBox(width: 40),
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_forward, color: Colors.black),
                      onPressed: () {
                        _onItemTapped(_currentIndex + 1);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
