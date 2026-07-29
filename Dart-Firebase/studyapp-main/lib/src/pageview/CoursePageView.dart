import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CoursePageview extends StatelessWidget {
  final List<Map<String, dynamic>> courseContent;

  const CoursePageview({
    Key? key,
    required this.courseContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: courseContent.map((content) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Markdown(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    data: content['text'],
                    styleSheet: MarkdownStyleSheet(
                      h1: const TextStyle(
                          color: Color(0xFF2C2C5E),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'MontserratAlternates'),
                      code: TextStyle(
                        backgroundColor: Colors.grey[900],
                        color: Colors.white,
                        fontFamily: 'Courier',
                        fontSize: 14,
                      ),
                      codeblockDecoration:
                          BoxDecoration(color: Colors.grey[900]),
                      p: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 68, 68, 87),
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                      h2: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF2C2C5E),
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                        height: 1,
                      ),
                      listBullet: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                      h3: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF2C2C5E),
                        fontFamily: 'Poppins',
                        letterSpacing: 1.5,
                        height: 1,
                      ),
                    )
                    // Add the syntax highlighter here if needed

                    ),
                // ... other widgets
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
