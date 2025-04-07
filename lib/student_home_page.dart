import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Student Dashboard'),
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
                  Icon(Icons.account_circle, size: 60, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Student Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/editProfile'); // Add navigation
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle('Student Details'),
              _infoCard('Name: John Doe\nLocation: Dhaka\nGrade: Class 9'),
              SizedBox(height: 20),
              _sectionTitle('Requirement Details'),
              _infoCard(
                'Looking for a tutor in Math and Science.\nAvailable: Evenings\nBudget: 2000-3000 BDT',
              ),
              SizedBox(height: 20),
              _sectionTitle('Find Tutors'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tutorList');
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 6),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search for Tutors',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.search, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _sectionTitle('Tutor Ratings'),
              _infoCard(
                'Top Tutors:\n1. Mr. Miraj (4.8/5)\n2. Ms. Shanta (4.7/5)\n3. Mr. Salakin (4.6/5)',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.deepPurple,
      ),
    );
  }

  Widget _infoCard(String content) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Text(
        content,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
