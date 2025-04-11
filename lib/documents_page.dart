import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  final List<Map<String, String>> documents = [
    {
      'title': 'Resume',
      'status': 'Verified',
      'description': 'Your professional resume.',
    },
    {
      'title': 'Degree Certificate',
      'status': 'Pending',
      'description': 'Proof of your academic qualifications.',
    },
    {
      'title': 'ID Proof',
      'status': 'Verified',
      'description': 'Government-issued ID for verification.',
    },
    {
      'title': 'Experience Letter',
      'status': 'Pending',
      'description': 'Letter from previous employers.',
    },
  ];

  DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents & Credentials'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          document['status'] == 'Verified'
                              ? Icons.check_circle
                              : Icons.pending,
                          color:
                              document['status'] == 'Verified'
                                  ? Colors.green
                                  : Colors.orange,
                          size: 30,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            document['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      document['description']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status: ${document['status']}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color:
                                document['status'] == 'Verified'
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  document['status'] == 'Verified'
                                      ? '${document['title']} is already verified.'
                                      : 'Please upload or update ${document['title']}.',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                document['status'] == 'Verified'
                                    ? Colors.green
                                    : Colors.orange,
                          ),
                          child: Text(
                            document['status'] == 'Verified'
                                ? 'View'
                                : 'Upload',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
