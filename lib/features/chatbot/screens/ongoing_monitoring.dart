// lib/features/chatbot/screens/ongoing_monitoring_screen.dart
import 'package:flutter/material.dart';

class OngoingMonitoringScreen extends StatefulWidget {
  const OngoingMonitoringScreen({super.key});

  @override
  State<OngoingMonitoringScreen> createState() => _OngoingMonitoringScreenState();
}

class _OngoingMonitoringScreenState extends State<OngoingMonitoringScreen> {
  String _mood = 'Good';
  String _cravings = 'Low';
  bool _medicationTaken = true;
  String _notes = '';

  void _submitCheckIn() {
    // Simulate saving the check-in
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in saved successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Check-In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'How are you feeling today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _mood,
              onChanged: (value) => setState(() => _mood = value!),
              items: const [
                DropdownMenuItem(value: 'Excellent', child: Text('Excellent')),
                DropdownMenuItem(value: 'Good', child: Text('Good')),
                DropdownMenuItem(value: 'Neutral', child: Text('Neutral')),
                DropdownMenuItem(value: 'Bad', child: Text('Bad')),
                DropdownMenuItem(value: 'Terrible', child: Text('Terrible')),
              ],
              decoration: const InputDecoration(
                labelText: 'Mood',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cravings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _cravings,
              onChanged: (value) => setState(() => _cravings = value!),
              items: const [
                DropdownMenuItem(value: 'None', child: Text('None')),
                DropdownMenuItem(value: 'Low', child: Text('Low')),
                DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                DropdownMenuItem(value: 'High', child: Text('High')),
                DropdownMenuItem(value: 'Severe', child: Text('Severe')),
              ],
              decoration: const InputDecoration(
                labelText: 'Cravings',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Medication',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Taken'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: true,
                      onChanged: (value) => setState(() => _medicationTaken = value!),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Missed'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: false,
                      onChanged: (value) => setState(() => _medicationTaken = value!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Notes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Additional notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              onChanged: (value) => setState(() => _notes = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitCheckIn,
              child: const Text('Submit Check-In'),
            ),
          ],
        ),
      ),
    );
  }
}