// lib/features/community/screens/create_new_thread_screen.dart
import 'package:flutter/material.dart';

class CreateNewThreadScreen extends StatefulWidget {
  const CreateNewThreadScreen({super.key});

  @override
  State<CreateNewThreadScreen> createState() => _CreateNewThreadScreenState();
}

class _CreateNewThreadScreenState extends State<CreateNewThreadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate creating a new thread
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thread created successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Thread'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter a title for your thread',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                  hintText: 'Share your thoughts...',
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Post Thread'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}