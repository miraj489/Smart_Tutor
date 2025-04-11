import 'package:flutter/material.dart';

class TutorHomePage extends StatelessWidget {
  const TutorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text('Tutor Dashboard'),
        backgroundColor: const Color.fromARGB(255, 224, 222, 229),
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
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/editProfile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tutor Details Section with Picture
            _sectionTitle('Tutor Details'),
            const SizedBox(height: 10),
            Row(
              children: [
                // Tutor Details Text
                Expanded(
                  child: _infoCard(
                    'Name: Mr. John Doe\nSubject: Mathematics\nExperience: 5 years',
                  ),
                ),
                const SizedBox(width: 10),
                // Tutor Picture
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV6V5KpVGn-vZl_5Um5Fgka72RFq59rWdVOQ&s', // Replace with an actual online image URL
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dashboard Grid Layout
            Expanded(
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
                    '/documents',
                  ),
                ],
              ),
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
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
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
