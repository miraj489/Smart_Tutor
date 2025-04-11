import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ), // Increased space at the top to push content further down
            Text(
              'Smart Tutor',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Connecting Students with the Best Tutors!',
              style: TextStyle(fontSize: 18, color: Colors.deepPurple[400]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 150), // More space between text and button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/login',
                  ); // Navigate to login page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 164, 136, 210),
                  minimumSize: Size(double.infinity, 50), // Full-width button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('-> Go', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 40), // Space at the bottom
          ],
        ),
      ),
    );
  }
}
