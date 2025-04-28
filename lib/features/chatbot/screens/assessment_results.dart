// lib/features/chatbot/screens/assessment_results_screen.dart
import 'package:flutter/material.dart';

class AssessmentResultsScreen extends StatelessWidget {
  const AssessmentResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Your Assessment Results',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Overall Status',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Based on your responses, your current status is stable. However, we noticed some areas where you might benefit from additional support.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Recommendations',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _buildRecommendationItem('Practice mindfulness meditation for 10 minutes daily.'),
                    _buildRecommendationItem('Consider speaking with a therapist about your stress levels.'),
                    _buildRecommendationItem('Improve sleep hygiene by maintaining a consistent bedtime routine.'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to resource library

                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResourceLibraryScreen(),
                          ),
                        );*/


                      },
                      child: const Text('View Recommended Resources'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}