// lib/features/recovery/screens/recovery_history_screen.dart
import 'package:flutter/material.dart';

class RecoveryHistoryScreen extends StatelessWidget {
  const RecoveryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Filter by Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Show date picker
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Select Date Range')),
                    );
                  },
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Select Date'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    // Reset filters
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reset Filters')),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Historical Entries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 30, // Example number of historical entries
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text('Day ${index + 1}'),
                      subtitle: const Text('Mood: 😊 | Sleep: 7h | Cravings: Low'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to detailed view of the entry
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View Detailed Entry')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}