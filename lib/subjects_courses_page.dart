import 'package:flutter/material.dart';

class SubjectsCoursesPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'title': 'Mathematics for High School',
      'description':
          'Comprehensive math course covering algebra, geometry, and calculus.',
    },
    {
      'title': 'Physics for Beginners',
      'description':
          'Learn the basics of physics, including mechanics and thermodynamics.',
    },
    {
      'title': 'English Literature',
      'description':
          'Explore classic and modern English literature with in-depth analysis.',
    },
    {
      'title': 'Introduction to Programming',
      'description':
          'Learn programming fundamentals with hands-on coding exercises.',
    },
    {
      'title': 'Biology for Advanced Learners',
      'description': 'Dive deep into genetics, evolution, and human anatomy.',
    },
  ];

  SubjectsCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects & Courses'),
        backgroundColor: const Color.fromARGB(255, 225, 222, 229),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              margin: EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      course['description']!,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enrolled in ${course['title']}!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            199,
                            195,
                            207,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text('Enroll Now'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
