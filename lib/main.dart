import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'student_form_page.dart';
import 'student_home_page.dart';
import 'tutor_home_page.dart';
import 'tutor_list_page.dart';
import 'tution_detail_page.dart';
import 'registration_page.dart';
import 'search_jobs_page.dart';
import 'edit_options_page.dart';
import 'intro_video_page.dart';
import 'availability_page.dart';
import 'subjects_courses_page.dart';

void main() {
  runApp(SmartTutorApp());
}

class SmartTutorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Tutor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/studentForm': (context) => StudentFormPage(),
        '/studentHome': (context) => StudentHomePage(),
        '/tutorHome': (context) => TutorHomePage(),
        '/tutorList': (context) => TutorListPage(),
        '/tutionDetail': (context) => TutionDetailPage(),
        '/register': (context) => RegistrationPage(),
        '/searchJobs': (context) => SearchJobsPage(),
        '/editOptions': (context) => EditOptionsPage(),
        '/introVideo': (context) => IntroVideoPage(),
        '/availability': (context) => AvailabilityPage(),
        '/subjectsCourses': (context) => SubjectsCoursesPage(),
      },
    );
  }
}
