import 'package:flutter/material.dart';

class TutionDetailPage extends StatelessWidget {
  const TutionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data – in real case, pass it dynamically
    final Map<String, String> jobDetail = {
      'student': 'Rafi',
      'class': 'Class 9',
      'location': 'Dhanmondi',
      'subject': 'Math & Physics',
      'days': '3 days/week',
      'salary': '5000 BDT/month',
    };

    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text('Tuition Job Details'),
        backgroundColor: const Color.fromARGB(255, 228, 225, 232),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(Icons.school, size: 80, color: Colors.deepPurple),
                ),
                SizedBox(height: 20),
                _buildRow('Student Name:', jobDetail['student']!),
                _buildRow('Class:', jobDetail['class']!),
                _buildRow('Location:', jobDetail['location']!),
                _buildRow('Subject:', jobDetail['subject']!),
                _buildRow('Days/Week:', jobDetail['days']!),
                _buildRow('Salary:', jobDetail['salary']!),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Application Submitted!')),
                      );
                    },
                    icon: Icon(Icons.check_circle_outline),
                    label: Text('Apply Now', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Text(value, style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }
}
