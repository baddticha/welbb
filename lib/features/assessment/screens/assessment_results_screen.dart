import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:welb/features/assessment/models/wellness_assessment.dart';

class AssessmentResultsScreen extends StatelessWidget {
  final WellnessAssessment assessment;

  const AssessmentResultsScreen({
    super.key,
    required this.assessment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment Results'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Wellness Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 300,
              child: RadarChart(
                RadarChartData(
                  dataSets: [
                    RadarDataSet(
                      dataEntries: [
                        const RadarEntry(value: 3),
                        const RadarEntry(value: 4),
                        const RadarEntry(value: 2),
                        const RadarEntry(value: 5),
                        const RadarEntry(value: 3),
                      ],
                      fillColor: Colors.blue.withOpacity(0.3),
                      borderColor: Colors.blue,
                      borderWidth: 2,
                    ),
                  ],
                  radarBackgroundColor: Colors.transparent,
                  radarBorderData: const BorderSide(color: Colors.grey),
                  tickCount: 5,
                  ticksTextStyle: const TextStyle(color: Colors.grey),
                  getTitle: (index, angle) {
                    const titles = ['Emotional', 'Physical', 'Sleep', 'Cognitive', 'Activities'];
                    return RadarChartTitle(
                      text: titles[index],
                      angle: angle,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildAssessmentSection('Emotional States', assessment.emotionalStates),
            const SizedBox(height: 16),
            _buildAssessmentSection('Physical Health', assessment.physicalHealth),
            const SizedBox(height: 16),
            _buildAssessmentSection('Cognitive States', assessment.cognitiveStates),
            const SizedBox(height: 16),
            _buildSleepSection(assessment.sleepHours),
            const SizedBox(height: 16),
            _buildActivitiesSection(assessment.activities),
          ],
        ),
      ),
    );
  }

  Widget _buildAssessmentSection(String title, Map<String, int> data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...data.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entry.key),
                  Text('${entry.value}/5'),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildSleepSection(int hours) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sleep',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Hours of sleep: $hours'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivitiesSection(List<String> activities) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Activities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...activities.map((activity) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text('• $activity'),
            )),
          ],
        ),
      ),
    );
  }
} 