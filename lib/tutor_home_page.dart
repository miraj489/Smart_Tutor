import 'package:flutter/material.dart';

class TutorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Tutor Dashboard'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Tutor Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                // Navigate to edit profile
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            _buildOption(
              context,
              'Available Jobs',
              Icons.work,
              Colors.orangeAccent,
              '/searchJobs',
            ),
            _buildOption(
              context,
              'Edit Options',
              Icons.settings,
              Colors.blueAccent,
              '/editOptions',
            ),
            _buildOption(
              context,
              'Intro Video',
              Icons.video_library,
              Colors.pinkAccent,
              '/introVideo',
            ),
            _buildOption(
              context,
              'Availability',
              Icons.schedule,
              Colors.green,
              '/availability',
            ),
            _buildOption(
              context,
              'Subjects & Courses',
              Icons.book,
              Colors.purple,
              '/subjectsCourses',
            ),
            _buildOption(
              context,
              'Documents & Credentials',
              Icons.folder,
              Colors.teal,
              '/documents', // Add routeName for the new page
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    String routeName,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
