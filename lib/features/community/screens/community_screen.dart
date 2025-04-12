import 'package:flutter/material.dart';
import 'package:welb/core/widgets/custom_button.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/uzima_logo.png', height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Horizontal Scroll
            _buildCategoryChips(),
            const SizedBox(height: 20),

            // Pinned Posts
            _buildSectionHeader('📌 Pinned Post'),
            _buildPinnedPost('Community Guidelines'),
            _buildPinnedPost('How to Get the Most Support'),
            const SizedBox(height: 20),

            // Recent Discussions
            _buildSectionHeader('🗨️ Recent Discussions'),
            _buildDiscussionThread('Coping with Anxiety Today', 24, 8, '2h'),
            _buildDivider(),
            _buildDiscussionThread('My 30-Day Recovery Journey', 56, 12, '5h'),
            _buildDivider(),
            _buildDiscussionThread('Therapist Q: Sleep Tips?', 32, 5, '1d'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
        currentIndex: 1, // Highlight Community tab
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['All', 'Support', 'Recovery', 'Stories', 'Q&A', 'Resources'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) =>
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(category),
                backgroundColor: category == 'All'
                    ? Colors.green[100]
                    : Colors.grey[200],
              ),
            )
        ).toList(),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPinnedPost(String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildDiscussionThread(String title, int likes, int comments, String time) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          _buildMetric(Icons.thumb_up, likes),
          const SizedBox(width: 16),
          _buildMetric(Icons.comment, comments),
          const SizedBox(width: 16),
          _buildMetric(Icons.access_time, null, time),
        ],
      ),
      onTap: () {}, // Add navigation to thread detail
    );
  }

  Widget _buildMetric(IconData icon, int? count, [String? text]) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text ?? count.toString(),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1);
  }
}