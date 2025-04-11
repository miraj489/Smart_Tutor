import 'package:flutter/material.dart';

class IntroVideoPage extends StatelessWidget {
  const IntroVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Video'),
        backgroundColor: const Color.fromARGB(255, 224, 222, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tutor Introduction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 16),
            // Placeholder for the video
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: const Color.fromARGB(255, 92, 63, 142),
                  size: 64,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Placeholder action for play button
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Play button clicked!')),
                    );
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text('Play'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 211, 222),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Placeholder action for stop button
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Stop button clicked!')),
                    );
                  },
                  icon: Icon(Icons.stop),
                  label: Text('Stop'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 195, 190, 203),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'About the Tutor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Hello! I am a professional tutor with over 5 years of experience in teaching Mathematics, Physics, and Programming. My goal is to make learning fun and engaging for students.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
