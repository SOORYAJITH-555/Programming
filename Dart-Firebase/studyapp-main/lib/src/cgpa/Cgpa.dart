import 'package:flutter/material.dart';

class Cgpa extends StatefulWidget {
  const Cgpa({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Cgpa> createState() => _CgpaState();
}

class _CgpaState extends State<Cgpa> {
  String _selectedSemester = 'Semester 1'; // Initially selected semester
  List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];

  Map<String, List<Map<String, dynamic>>> subjectsBySemester = {
    'Semester 1': [
      {'name': 'Communication Skills In English', 'credits': 4.0},
      {'name': 'Applied Physics 1', 'credits': 3.0},
      {'name': 'Mathematics 1', 'credits': 5.0},
      {'name': 'Applied Chemistry', 'credits': 3.0},
      {'name': 'Engineering Graphics', 'credits': 1.5},
      {'name': 'Applied Chemistry Lab', 'credits': 1.0},
      {'name': 'Introduction to IT Systems Lab', 'credits': 2.0},
      {'name': 'Sports & Yoga', 'credits': 1.0},
    ],
    'Semester 2': [
      {'name': 'Mathematics II', 'credits': 4.0},
      {'name': 'Applied Physics II', 'credits': 3.0},
      {'name': 'Environmental Science', 'credits': 0.0},
      {
        'name': 'Fundamentals of Electrical & Electronics Engineering',
        'credits': 3.0
      },
      {'name': 'Problem Solving and Programming', 'credits': 3.0},
      {'name': 'Communication Skills in English Lab', 'credits': 1.5},
      {'name': 'Applied Physics Lab', 'credits': 1.0},
      {
        'name': 'Fundamentals of Eletrical & Electronics Engineering Lab',
        'credits': 0.0
      },
      {'name': 'Problem Solving and Programming Lab', 'credits': 0.0},
      {'name': 'Engineering Workshop Practice', 'credits': 1.5},
    ],
    'Semester 3': [
      //{'name': 'Internship I', 'credits': 2.0},
      {'name': 'Computer Organisation', 'credits': 4.0},
      {'name': 'Programming in C', 'credits': 3.0},
      {'name': 'Database Management Systems', 'credits': 3.0},
      {'name': 'Digital Computer Fundamentals', 'credits': 3.0},
      {'name': 'Programming in C Lab', 'credits': 1.5},
      {'name': 'Database Management System lab', 'credits': 1.5},
      {'name': 'Digital Computer Fundamentals Lab', 'credits': 1.5},
      {'name': 'Web Technology lab', 'credits': 2.5},
      {'name': 'Computer System Hardware Lab', 'credits': 0.0},
    ],
    'Semester 4': [
      {'name': 'Data Structures', 'credits': 4.0},
      {'name': 'Object Oriented Programming', 'credits': 4.0},
      {'name': 'Computer Communication and Networks', 'credits': 3.0},
      {'name': 'Community Skills in Indian knowledge system', 'credits': 0.0},
      {'name': 'Object Oriented Programming Lab', 'credits': 1.5},
      {'name': 'Web Programming Lab', 'credits': 2.5},
      {'name': 'Data Structures Lab', 'credits': 1.5},
      {'name': 'Application Development Lab', 'credits': 0.0},
      //{'name': 'Minor Project', 'credits': 2.0},
    ],
    'Semester 5': [
      // {'name': 'Internship II', 'credits': 3.0},
      {'name': 'Project Management and Software Engineering', 'credits': 0.0},
      {
        'name': 'Embedded System and Real time Operating System',
        'credits': 4.0
      },
      {'name': 'Operating System', 'credits': 4.0},
      {
        'name': 'Embedded System and Real time Operating System Lab',
        'credits': 1.5
      },
      {'name': 'System Administration Lab', 'credits': 1.5},
      //{'name': 'Seminar', 'credits': 1.0},
      {'name': 'Ethical Hacking', 'credits': 4.0},
    ],
    'Semester 6': [
      //{'name': 'Major Project', 'credits': 4.0},
      {'name': 'Entrepreneurship and Startup', 'credits': 4.0},
      {'name': 'Indian Constitution', 'credits': 0.0},
      {'name': 'Computer Network Engineering Lab', 'credits': 2.5},
      {'name': 'Smart Device Programming', 'credits': 1.5},
      {'name': 'Software Testing', 'credits': 4.0},
      {'name': 'Software Testing Lab', 'credits': 1.5},
      {'name': 'Elective Courses', 'credits': 4.0},
    ],
  };

  List<TextEditingController> gradeControllers = [];
  List<String> gradeOptions = [
    'S',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F'
  ]; // Grades options

  List<String> selectedSemesters = [];
  Map<String, double> sgpaBySemester = {};

  void _calculateSgpa(String semester) {
    double totalGradePoints = 0;
    double totalCredits = 0;

    for (int i = 0; i < subjectsBySemester[semester]!.length; i++) {
      double grade =
          _gradeToPoint(gradeControllers[i].text); // Convert grade to point
      double credits = subjectsBySemester[semester]![i]['credits'];
      if (credits > 0) {
        totalGradePoints += credits * grade;
        totalCredits += credits;
      }
    }

    double sgpa = totalCredits > 0 ? totalGradePoints / totalCredits : 0.0;

    setState(() {
      sgpaBySemester[semester] = sgpa;
    });
  }

  double _gradeToPoint(String grade) {
    switch (grade) {
      case 'S':
        return 10.0;
      case 'A':
        return 9.0;
      case 'B':
        return 8.0;
      case 'C':
        return 7.0;
      case 'D':
        return 6.0;
      case 'E':
        return 5.0;
      case 'F':
        return 4.0;
      default:
        return 4.0;
    }
  }

  void _calculateOverallPercentage() {
    double totalSemesters = selectedSemesters.length.toDouble();
    double totalSGPA = 0.0;

    for (var semester in selectedSemesters) {
      totalSGPA += sgpaBySemester[semester] ?? 0.0;
    }

    double avgSGPA = totalSGPA / totalSemesters;
    double percentage = avgSGPA * 10.0;

    // Show percentage in a dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Overall Percentage of Selected Semesters'),
        content: Text('The percentage is: ${percentage.toStringAsFixed(2)}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _refresh() {
    setState(() {
      sgpaBySemester.clear();
      selectedSemesters.clear();
      _initializeControllers();
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    gradeControllers.clear();
    List<Map<String, dynamic>> selectedSubjects =
        subjectsBySemester[_selectedSemester]!;
    for (int i = 0; i < selectedSubjects.length; i++) {
      gradeControllers.add(TextEditingController(
          text: gradeOptions[
              0])); // Initialize grade controllers with default value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: _selectedSemester,
              items: semesters
                  .map((semester) => DropdownMenuItem<String>(
                        value: semester,
                        child: Text(
                          semester,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ))
                  .toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedSemester = value!;
                  _initializeControllers();
                });
              },
            ),
            SizedBox(height: 20.0),
            if (gradeControllers.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: gradeControllers.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjectsBySemester[_selectedSemester]![index]['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: gradeControllers[index]
                              .text, // Set value from gradeControllers
                          items: gradeOptions
                              .map((grade) => DropdownMenuItem<String>(
                                    value: grade,
                                    child: Text(
                                      grade,
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              gradeControllers[index].text = value ??
                                  ''; // Update grade value in gradeControllers
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Grade',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ElevatedButton(
              onPressed: () {
                _calculateSgpa(_selectedSemester);
                if (!selectedSemesters.contains(_selectedSemester)) {
                  selectedSemesters.add(_selectedSemester);
                }
              },
              child: Text(
                'Calculate GPA for $_selectedSemester',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 20.0),
            if (selectedSemesters.isNotEmpty)
              Text(
                'GPA for Selected Semesters:',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 10.0),
            if (selectedSemesters.isNotEmpty)
              Column(
                children: selectedSemesters
                    .map(
                      (semester) => Text(
                        '$semester: ${sgpaBySemester[semester]?.toStringAsFixed(2) ?? "N/A"}',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                    .toList(),
              ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: selectedSemesters.isNotEmpty
                  ? _calculateOverallPercentage
                  : null,
              child: Text(
                'Calculate CGPA',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PercentagePage extends StatelessWidget {
  final double percentage;

  const PercentagePage({Key? key, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Percentage of All Semester SGPA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The percentage is:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '${percentage.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
