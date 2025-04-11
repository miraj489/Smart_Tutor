import 'package:flutter/material.dart';

class TutorRatingsPage extends StatelessWidget {
  const TutorRatingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tutors = [
      {'name': 'Mr. Miraj', 'rating': 4.8},
      {'name': 'Ms. Shanta', 'rating': 4.7},
      {'name': 'Mr. Salakin', 'rating': 4.6},
      {'name': 'Ms. Ayesha', 'rating': 4.5},
      {'name': 'Mr. Rahim', 'rating': 4.4},
      {'name': 'Ms. Fatima', 'rating': 4.3},
      {'name': 'Mr. Karim', 'rating': 4.2},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutor Ratings'),
        backgroundColor: const Color.fromARGB(255, 222, 219, 226),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tutors.length,
          itemBuilder: (context, index) {
            final tutor = tutors[index];
            return Column(
              children: [
                _ratingCard(context, tutor['name'], tutor['rating']),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _ratingCard(BuildContext context, String name, double rating) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Rating: $rating/5',
                style: const TextStyle(fontSize: 14, color: Colors.deepPurple),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              _showRatingDialog(context, name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 181, 176, 192),
            ),
            child: const Text('Rate'),
          ),
        ],
      ),
    );
  }

  void _showRatingDialog(BuildContext context, String tutorName) {
    showDialog(
      context: context,
      builder: (context) {
        double selectedRating = 0.0;

        return AlertDialog(
          title: Text('Rate $tutorName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select a rating:'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    onPressed: () {
                      selectedRating = index + 1.0;
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You rated $tutorName $selectedRating/5',
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.star,
                      color:
                          index < selectedRating ? Colors.orange : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
