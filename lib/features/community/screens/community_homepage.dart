// lib/features/community/screens/community_home_page.dart
import 'package:flutter/material.dart';

class CommunityHomePage extends StatelessWidget {
  const CommunityHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Trending Topics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example of trending topics
            _buildTrendingTopics(),
            const SizedBox(height: 30),
            const Text(
              'Forum Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Example of forum categories
            _buildForumCategories(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create new post/thread screen
          // For now, just show a snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create New Post')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTrendingTopics() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildTopicCard('Mental Health Tips'),
          _buildTopicCard('Recovery Stories'),
          _buildTopicCard('Coping Strategies'),
          _buildTopicCard('Support Groups'),
        ],
      ),
    );
  }

  Widget _buildTopicCard(String title) {
    return Card(
      margin: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Join the discussion and share your thoughts.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForumCategories() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        final categories = [
          'General Support',
          'Substance Abuse Recovery',
          'Success Stories',
          'Resources and Tips',
          'Ask a Therapist',
        ];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(categories[index]),
          ),
        );
      },
    );
  }
}