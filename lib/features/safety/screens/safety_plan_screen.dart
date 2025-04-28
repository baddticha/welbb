import 'package:flutter/material.dart';

class SafetyPlanScreen extends StatelessWidget {
  const SafetyPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Plan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Emergency Contacts',
              [
                _buildContactCard('Therapist', 'Dr. Smith', '555-123-4567'),
                _buildContactCard('Support Person', 'Sarah', '555-987-6543'),
                _buildContactCard('Family Member', 'Mom', '555-456-7890'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Warning Signs',
              [
                _buildListItem('Feeling overwhelmed'),
                _buildListItem('Difficulty sleeping'),
                _buildListItem('Loss of appetite'),
                _buildListItem('Withdrawing from others'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Coping Strategies',
              [
                _buildListItem('Practice deep breathing'),
                _buildListItem('Go for a walk'),
                _buildListItem('Listen to calming music'),
                _buildListItem('Call a friend'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Safe Places',
              [
                _buildListItem('Local park'),
                _buildListItem('Community center'),
                _buildListItem('Library'),
                _buildListItem('Coffee shop'),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              'Professional Help',
              [
                _buildListItem('Schedule therapy appointment'),
                _buildListItem('Contact crisis hotline'),
                _buildListItem('Visit emergency room if needed'),
              ],
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement emergency action
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Emergency action initiated')),
                  );
                },
                icon: const Icon(Icons.warning),
                label: const Text('Emergency Action'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildContactCard(String type, String name, String phone) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(name),
        subtitle: Text('$type - $phone'),
        trailing: IconButton(
          icon: const Icon(Icons.phone),
          onPressed: () {
            // TODO: Implement phone call
          },
        ),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.check_circle_outline),
        title: Text(text),
      ),
    );
  }
} 