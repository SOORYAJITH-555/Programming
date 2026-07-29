import 'package:flutter/material.dart';
import 'package:studyapp/src/settings/imageViewer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our Story',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF2C2C5E),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'MontserratAlternates',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'At the heart of our journey lies a passion for empowering aspiring professionals, especially those pursuing diplomas, to excel in their career journeys. Recognizing the challenges faced by students in navigating the complexities of job preparation, we embarked on a mission to develop a comprehensive solution - the Job Prep Tool.\n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 68, 68, 87),
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Our story began with a deep understanding of the existing systems and their limitations. We observed the gaps in traditional job preparation methods and identified the need for a tailored solution that addresses the unique requirements of diploma students. Armed with this insight, we set out to create a platform that not only equips users with essential skills but also fosters confidence and readiness for the competitive job market.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 68, 68, 87),
                        fontFamily: 'Poppins',
                        letterSpacing: 1,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Our Team',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF2C2C5E),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: 'MontserratAlternates',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/soorya.jpg'),
                  name: 'Sooryajith Baiju'),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/shahul.jpg'), name: 'Shahul N.R'),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/saran.jpg'), name: 'Saran T.K'),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/sijil1.jpg'), name: 'Sijil George'),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/gautham.jpg'),
                  name: 'Gautham Sumeer'),
              SizedBox(
                height: 20,
              ),
              ImageViewer(
                  image: AssetImage('images/anjal.jpg'), name: 'Anjal Saju'),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Join us in revolutionizing job preparation for diploma students, together towards a future of empowerment and success.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 68, 68, 87),
                    fontFamily: 'Poppins',
                    letterSpacing: 1,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
