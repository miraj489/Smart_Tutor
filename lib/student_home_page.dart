import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        backgroundColor: const Color.fromARGB(255, 223, 220, 228),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome, John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Grade: Class 9',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.deepPurple),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/editProfile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.deepPurple),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Details Section
            _sectionTitle('Student Details'),
            const SizedBox(height: 10),
            Row(
              children: [
                // Student Details Text
                Expanded(
                  child: _infoCard(
                    'Name: John Doe\nLocation: Dhaka\nGrade: Class 9',
                  ),
                ),
                const SizedBox(width: 10),
                // Student Picture
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/033/837/660/small/happy-school-pupil-asian-boy-in-glasses-on-isolated-on-studio-background-with-copy-space-back-to-school-ai-generative-photo.jpeg', // Replace with an actual online image URL
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Dashboard Navigation Buttons in Grid Layout
            _sectionTitle('Dashboard'),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                children: [
                  _dashboardBox(
                    context,
                    title: 'Edit Profile',
                    icon: Icons.edit,
                    route: '/editProfile',
                  ),
                  _dashboardBox(
                    context,
                    title: 'Requirement Details',
                    icon: Icons.list_alt,
                    route: '/requirementDetails',
                  ),
                  _dashboardBox(
                    context,
                    title: 'Tutor Ratings',
                    icon: Icons.star,
                    route: '/tutorRatings',
                  ),
                  _dashboardBox(
                    context,
                    title: 'Tutor List',
                    icon: Icons.people,
                    route: '/tutorList',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10), // Reduced the gap from 20 to 10
            // Top Tutors Section
            _sectionTitle('Top Tutors'),
            _infoCard(
              '1. Mr. Miraj (4.8/5)\n2. Ms. Shanta (4.7/5)\n3. Mr. Salakin (4.6/5)',
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Widget _infoCard(String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }

  Widget _dashboardBox(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String route,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
