import 'package:flutter/material.dart';

class DailyAssessmentScreen extends StatefulWidget {
  const DailyAssessmentScreen({super.key});

  @override
  State<DailyAssessmentScreen> createState() => _DailyAssessmentScreenState();
}

class _DailyAssessmentScreenState extends State<DailyAssessmentScreen> {
  final Map<String, double> emotionalStates = {
    'Anxiety Level': 5,
    'Depression Level': 5,
    'Stress Level': 5,
    'Overall Mood': 5,
    'Energy Level': 5,
  };

  final Map<String, double> physicalHealth = {
    'Sleep Quality': 5,
    'Physical Activity': 5,
    'Appetite Level': 5,
    'Pain Level': 5,
  };

  double sleepHours = 7;

  final Map<String, double> cognitiveStates = {
    'Concentration': 5,
    'Memory Function': 5,
    'Decision Making': 5,
    'Racing Thoughts': 5,
    'Intrusive Thoughts': 5,
  };

  final List<String> selectedActivities = [];
  final List<String> availableActivities = [
    'Work',
    'Exercise',
    'Meditation',
    'Therapy',
    'Social Activity',
    'Hobbies',
    'Rest',
    'Study',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Assessment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateHeader(),
            const SizedBox(height: 24),
            _buildSection(
              'Emotional State',
              emotionalStates,
              Icons.emoji_emotions,
              Colors.blue,
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Physical Health',
              physicalHealth,
              Icons.health_and_safety,
              Colors.green,
            ),
            const SizedBox(height: 24),
            _buildSleepSection(),
            const SizedBox(height: 24),
            _buildSection(
              'Cognitive Measures',
              cognitiveStates,
              Icons.psychology,
              Colors.purple,
            ),
            const SizedBox(height: 24),
            _buildActivitiesSection(),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _submitAssessment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
                child: const Text('Submit Assessment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today\'s Assessment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateTime.now().toString().split(' ')[0],
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    Map<String, double> metrics,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...metrics.entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key),
                      Text(entry.value.round().toString()),
                    ],
                  ),
                  Slider(
                    value: entry.value,
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: entry.value.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        metrics[entry.key] = value;
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.bedtime, color: Colors.indigo),
                SizedBox(width: 8),
                Text(
                  'Sleep Duration',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Hours of Sleep'),
                Text(sleepHours.toStringAsFixed(1)),
              ],
            ),
            Slider(
              value: sleepHours,
              min: 0,
              max: 12,
              divisions: 24,
              label: sleepHours.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  sleepHours = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitiesSection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.local_activity, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'Daily Activities',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: availableActivities.map((activity) {
                final isSelected = selectedActivities.contains(activity);
                return FilterChip(
                  label: Text(activity),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedActivities.add(activity);
                      } else {
                        selectedActivities.remove(activity);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _submitAssessment() {
    // TODO: Save assessment data locally
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assessment submitted successfully')),
    );
    
    // Navigate to results/insights screen
    Navigator.pop(context);
  }
} 