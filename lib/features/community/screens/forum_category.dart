// lib/features/community/screens/forum_category_screen.dart
import 'package:flutter/material.dart';

class ForumCategoryScreen extends StatelessWidget {
  final String categoryTitle;

  const ForumCategoryScreen({required this.categoryTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Recent Threads',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Example number of threads
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text('Thread Title $index'),
                      subtitle: Text('Posted by User on Date'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to thread detail screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View Thread')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create new thread screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create New Thread')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}