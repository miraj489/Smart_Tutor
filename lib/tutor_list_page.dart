import 'package:flutter/material.dart';

class TutorListPage extends StatefulWidget {
  const TutorListPage({super.key});

  @override
  _TutorListPageState createState() => _TutorListPageState();
}

class _TutorListPageState extends State<TutorListPage> {
  // Sample tutor data (replace with real data as needed)
  List<Map<String, String>> tutorList = [
    {
      'name': 'Rafiul Ahmed',
      'subject': 'Math',
      'experience': '5 years',
      'location': 'Dhanmondi',
      'phone': '01712345678',
    },
    {
      'name': 'Tania Rahman',
      'subject': 'Physics',
      'experience': '3 years',
      'location': 'Uttara',
      'phone': '01812345678',
    },
    {
      'name': 'Rahim Khan',
      'subject': 'Chemistry',
      'experience': '7 years',
      'location': 'Mirpur',
      'phone': '01912345678',
    },
    {
      'name': 'Sadia Islam',
      'subject': 'Biology',
      'experience': '4 years',
      'location': 'Dhanmondi',
      'phone': '01612345678',
    },
  ];

  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredList =
        selectedFilter == 'All'
            ? tutorList
            : tutorList
                .where((item) => item['location'] == selectedFilter)
                .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tutors List'),
        backgroundColor: const Color.fromARGB(255, 228, 226, 232),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_alt),
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(value: "All", child: Text("All")),
                  PopupMenuItem(value: "Dhanmondi", child: Text("Dhanmondi")),
                  PopupMenuItem(value: "Uttara", child: Text("Uttara")),
                  PopupMenuItem(value: "Mirpur", child: Text("Mirpur")),
                ],
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple[50],
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final item = filteredList[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text('${item['name']} - ${item['subject']}'),
              subtitle: Text(
                'Experience: ${item['experience']}\nLocation: ${item['location']}',
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Show tutor's phone number in a dialog
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Tutor Contact'),
                        content: Text('Phone: ${item['phone']}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 215, 212, 222),
                ),
                child: Text('View Details'),
              ),
            ),
          );
        },
      ),
    );
  }
}
