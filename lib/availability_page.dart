import 'package:flutter/material.dart';

class AvailabilityPage extends StatelessWidget {
  final List<String> availableTimes = [
    'Monday: 10:00 AM - 12:00 PM',
    'Wednesday: 2:00 PM - 4:00 PM',
    'Friday: 6:00 PM - 8:00 PM',
  ];

  final List<String> bookedTimes = [
    'Tuesday: 3:00 PM - 5:00 PM (Student: John Doe)',
    'Thursday: 1:00 PM - 3:00 PM (Student: Jane Smith)',
    'Saturday: 10:00 AM - 12:00 PM (Student: Alex Johnson)',
  ];

  AvailabilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Availability'),
        backgroundColor: const Color.fromARGB(255, 225, 223, 229),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Times',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap:
                    true, // Ensures the ListView takes only the necessary space
                physics:
                    NeverScrollableScrollPhysics(), // Prevents nested scrolling
                itemCount: availableTimes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.access_time, color: Colors.green),
                      title: Text(
                        availableTimes[index],
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              Text(
                'Booked Times',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap:
                    true, // Ensures the ListView takes only the necessary space
                physics:
                    NeverScrollableScrollPhysics(), // Prevents nested scrolling
                itemCount: bookedTimes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.event_busy, color: Colors.red),
                      title: Text(
                        bookedTimes[index],
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
