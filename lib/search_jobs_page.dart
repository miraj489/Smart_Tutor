import 'package:flutter/material.dart';

class SearchJobsPage extends StatefulWidget {
  const SearchJobsPage({super.key});

  @override
  _SearchJobsPageState createState() => _SearchJobsPageState();
}

class _SearchJobsPageState extends State<SearchJobsPage> {
  bool showFilter = false;
  Map<String, String>? selectedJob;

  final List<Map<String, String>> jobs = [
    {
      'title': 'Female Tutor Needed for English Medium',
      'location': 'Khagan Birulia Savar Dhaka',
      'class': 'Standard 4',
      'category': 'English Medium',
      'subject': 'All',
      'studentGender': 'Female',
      'preferredTutor': 'Female',
      'tutoringTime': 'Negotiable',
      'tutoringDays': '4 Days/Week',
      'noOfStudents': '1',
      'tuitionFee': '6000 tk',
      'otherRequirement':
          'A Level background. Highly experienced tutors are requested to apply.',
      'timePosted': '3 hours ago',
    },
    {
      'title': 'Male Tutor Needed for Bangla Medium',
      'location': 'Akra Birulia Dhaka',
      'class': 'Standard 6',
      'category': 'Bangla Medium',
      'subject': 'Math',
      'studentGender': 'Male',
      'preferredTutor': 'Male',
      'tutoringTime': 'Evening',
      'tutoringDays': '3 Days/Week',
      'noOfStudents': '2',
      'tuitionFee': '5000 tk',
      'otherRequirement': 'Experienced tutors preferred.',
      'timePosted': '5 hours ago',
    },
    {
      'title': 'Tutor Needed for Science',
      'location': 'Dhanmondi Dhaka',
      'class': 'Standard 8',
      'category': 'English Medium',
      'subject': 'Science',
      'studentGender': 'Any',
      'preferredTutor': 'Any',
      'tutoringTime': 'Afternoon',
      'tutoringDays': '5 Days/Week',
      'noOfStudents': '1',
      'tuitionFee': '8000 tk',
      'otherRequirement': 'Must have experience teaching science subjects.',
      'timePosted': '2 hours ago',
    },
    {
      'title': 'Female Tutor Needed for Primary Student',
      'location': 'Uttara Dhaka',
      'class': 'Standard 3',
      'category': 'Bangla Medium',
      'subject': 'All',
      'studentGender': 'Female',
      'preferredTutor': 'Female',
      'tutoringTime': 'Morning',
      'tutoringDays': '6 Days/Week',
      'noOfStudents': '1',
      'tuitionFee': '4000 tk',
      'otherRequirement': 'Patient and experienced with young children.',
      'timePosted': '1 hour ago',
    },
    {
      'title': 'Experienced Tutor Needed for Higher Math',
      'location': 'Mirpur Dhaka',
      'class': 'Standard 10',
      'category': 'English Medium',
      'subject': 'Higher Math',
      'studentGender': 'Male',
      'preferredTutor': 'Male',
      'tutoringTime': 'Evening',
      'tutoringDays': '4 Days/Week',
      'noOfStudents': '1',
      'tuitionFee': '10000 tk',
      'otherRequirement': 'Must have expertise in Higher Math.',
      'timePosted': '30 minutes ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuition Jobs'),
        backgroundColor: const Color.fromARGB(255, 222, 219, 226),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              setState(() {
                showFilter = !showFilter;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.location_on, color: Colors.deepPurple),
                    title: Text(
                      job['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(job['location']!),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: Colors.green,
                            ),
                            SizedBox(width: 4),
                            Text(
                              job['timePosted']!,
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedJob = job;
                        });
                      },
                      child: Text(
                        'View details',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (showFilter) _buildFilterOverlay(),
          if (selectedJob != null) _buildJobDetailOverlay(),
        ],
      ),
    );
  }

  Widget _buildFilterOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Advance Filter',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            showFilter = false;
                          });
                        },
                      ),
                    ],
                  ),
                  Divider(),
                  _buildFilterOption('Tuition Type', [
                    'All Tuition',
                    'Home Tuition',
                    'Online Tuition',
                  ]),
                  _buildFilterOption('Tutor Preference', [
                    'All',
                    'Male',
                    'Female',
                  ]),
                  _buildFilterOption('Select District', [
                    'All',
                    'Dhaka',
                    'Chittagong',
                  ]),
                  _buildFilterOption('Select Medium', [
                    'All',
                    'English Medium',
                    'Bangla Medium',
                  ]),
                  _buildFilterOption('Select Class', [
                    'All',
                    'Standard 4',
                    'Standard 6',
                  ]),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showFilter = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text('Apply Filter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items:
              options.map((option) {
                return DropdownMenuItem(value: option, child: Text(option));
              }).toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }

  Widget _buildJobDetailOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            selectedJob!['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              selectedJob = null;
                            });
                          },
                        ),
                      ],
                    ),
                    Divider(),
                    _buildJobDetailRow('Location', selectedJob!['location']!),
                    _buildJobDetailRow('Class', selectedJob!['class']!),
                    _buildJobDetailRow('Category', selectedJob!['category']!),
                    _buildJobDetailRow('Subject', selectedJob!['subject']!),
                    _buildJobDetailRow(
                      'Student Gender',
                      selectedJob!['studentGender']!,
                    ),
                    _buildJobDetailRow(
                      'Preferred Tutor',
                      selectedJob!['preferredTutor']!,
                    ),
                    _buildJobDetailRow(
                      'Tutoring Time',
                      selectedJob!['tutoringTime']!,
                    ),
                    _buildJobDetailRow(
                      'Tutoring Days',
                      selectedJob!['tutoringDays']!,
                    ),
                    _buildJobDetailRow(
                      'No. of Students',
                      selectedJob!['noOfStudents']!,
                    ),
                    _buildJobDetailRow(
                      'Tuition Fee',
                      selectedJob!['tuitionFee']!,
                    ),
                    _buildJobDetailRow(
                      'Other Requirement',
                      selectedJob!['otherRequirement']!,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Application Submitted!')),
                        );
                        setState(() {
                          selectedJob = null;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                      ),
                      child: Text('Apply Now'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
