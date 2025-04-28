// lib/features/recovery/screens/daily_log_entry_screen.dart
import 'package:flutter/material.dart';

class DailyLogEntryScreen extends StatefulWidget {
  const DailyLogEntryScreen({super.key});

  @override
  State<DailyLogEntryScreen> createState() => _DailyLogEntryScreenState();
}

class _DailyLogEntryScreenState extends State<DailyLogEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  String _mood = 'Good';
  int _sleepHours = 7;
  String _cravings = 'Low';
  bool _medicationTaken = true;
  String _notes = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simulate saving the log entry
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Log entry saved successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Log Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
                onChanged: (value) {
                  setState(() => _mood = value!);
                },
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
                'Sleep Hours',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: _sleepHours.toString(),
                onChanged: (value) {
                  setState(() => _sleepHours = int.parse(value));
                },
                decoration: const InputDecoration(
                  labelText: 'Hours slept',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter sleep hours';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Cravings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _cravings,
                onChanged: (value) {
                  setState(() => _cravings = value!);
                },
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
                        groupValue: _medicationTaken,
                        onChanged: (value) => setState(() => _medicationTaken = value!),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Missed'),
                      leading: Radio<bool>(
                        value: false,
                        groupValue: _medicationTaken,
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
                controller: TextEditingController(text: _notes),
                onChanged: (value) => setState(() => _notes = value),
                decoration: const InputDecoration(
                  labelText: 'Additional notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Save Log Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}