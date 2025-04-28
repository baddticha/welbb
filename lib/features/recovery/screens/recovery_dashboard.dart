// lib/features/recovery/screens/recovery_dashboard.dart
import 'package:flutter/material.dart';
import 'package:welb/features/recovery/screens/recovery_history.dart';
import 'package:welb/features/recovery/screens/recovery_analytics.dart';

class RecoveryDashboard extends StatelessWidget {
  const RecoveryDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecoveryHistoryScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.analytics),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecoveryAnalyticsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Today\'s Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildMetricCard('Mood', '😊', 'Good', () {
              // TODO: Navigate to mood tracking
            }),
            _buildMetricCard('Sleep', '7h', '7 hours', () {
              // TODO: Navigate to sleep tracking
            }),
            _buildMetricCard('Cravings', 'Low', 'Low intensity', () {
              // TODO: Navigate to cravings tracking
            }),
            _buildMetricCard('Medication', 'Taken', 'All doses taken', () {
              // TODO: Navigate to medication tracking
            }),
            const SizedBox(height: 30),
            const Text(
              'Recent Entries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildRecentEntries(context),
            const SizedBox(height: 30),
            const Text(
              'Trend Analysis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTrendChart(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to daily log entry screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create new log entry')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMetricCard(String title, String icon, String value, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.blue, size: 12),
                  const SizedBox(width: 10),
                  Text(title),
                ],
              ),
              Text(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentEntries(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          final dates = ['Yesterday', '2 Days Ago', '3 Days Ago', '4 Days Ago', '5 Days Ago'];
          return Card(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecoveryHistoryScreen()),
                );
              },
              child: SizedBox(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dates[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text('Mood: 😊'),
                      const SizedBox(height: 5),
                      const Text('Sleep: 7h'),
                      const SizedBox(height: 5),
                      const Text('Cravings: Low'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendChart(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RecoveryAnalyticsScreen()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              '📈 View detailed analytics',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}