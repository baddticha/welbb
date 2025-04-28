import 'package:flutter/material.dart';
import 'package:welb/core/widgets/custom_button.dart';
import 'package:welb/features/community/screens/forum_category.dart';

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
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryChips(context),
            const SizedBox(height: 20),
            _buildSectionHeader('📌 Pinned Post'),
            _buildPinnedPost('Community Guidelines', () {
              // TODO: Navigate to guidelines
            }),
            _buildPinnedPost('How to Get the Most Support', () {
              // TODO: Navigate to support guide
            }),
            const SizedBox(height: 20),
            _buildSectionHeader('🗨️ Recent Discussions'),
            _buildDiscussionThread('Coping with Anxiety Today', 24, 8, '2h', () {
              // TODO: Navigate to thread detail
            }),
            _buildDivider(),
            _buildDiscussionThread('My 30-Day Recovery Journey', 56, 12, '5h', () {
              // TODO: Navigate to thread detail
            }),
            _buildDivider(),
            _buildDiscussionThread('Therapist Q: Sleep Tips?', 32, 5, '1d', () {
              // TODO: Navigate to thread detail
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForumCategoryScreen(categoryTitle: 'New Post'),
            ),
          );
        },
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

  Widget _buildCategoryChips(BuildContext context) {
    final categories = ['All', 'Support', 'Recovery', 'Stories', 'Q&A', 'Resources'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) => 
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForumCategoryScreen(categoryTitle: category),
                    ),
                  );
                },
                child: Chip(
                  label: Text(category),
                  backgroundColor: category == 'All'
                      ? Colors.green[100]
                      : Colors.grey[200],
                ),
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

  Widget _buildPinnedPost(String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildDiscussionThread(String title, int likes, int comments, String time, VoidCallback onTap) {
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
      onTap: onTap,
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