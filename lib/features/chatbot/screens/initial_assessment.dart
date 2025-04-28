// lib/features/chatbot/screens/initial_assessment_screen.dart
import 'package:flutter/material.dart';

class InitialAssessmentScreen extends StatefulWidget {
  const InitialAssessmentScreen({super.key});

  @override
  State<InitialAssessmentScreen> createState() => _InitialAssessmentScreenState();
}

class _InitialAssessmentScreenState extends State<InitialAssessmentScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  String _mood = '';
  String _stressLevel = '';
  String _substanceUse = '';
  String _sleepQuality = '';

  List<Step> _getSteps() {
    return [
      Step(
        title: const Text('Mood'),
        content: Column(
          children: [
            const Text('How are you feeling today?'),
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
                labelText: 'Select your mood',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 0,
        state: _currentStep >= 0 ? StepState.indexed : StepState.disabled,
      ),
      Step(
        title: const Text('Stress Level'),
        content: Column(
          children: [
            const Text('How stressed do you feel?'),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _stressLevel,
              onChanged: (value) => setState(() => _stressLevel = value!),
              items: const [
                DropdownMenuItem(value: 'Not stressed', child: Text('Not stressed')),
                DropdownMenuItem(value: 'Slightly stressed', child: Text('Slightly stressed')),
                DropdownMenuItem(value: 'Moderately stressed', child: Text('Moderately stressed')),
                DropdownMenuItem(value: 'Very stressed', child: Text('Very stressed')),
                DropdownMenuItem(value: 'Extremely stressed', child: Text('Extremely stressed')),
              ],
              decoration: const InputDecoration(
                labelText: 'Select your stress level',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
        state: _currentStep >= 1 ? StepState.indexed : StepState.disabled,
      ),
      Step(
        title: const Text('Substance Use'),
        content: Column(
          children: [
            const Text('Have you used any substances recently?'),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _substanceUse,
              onChanged: (value) => setState(() => _substanceUse = value!),
              items: const [
                DropdownMenuItem(value: 'No', child: Text('No')),
                DropdownMenuItem(value: 'Yes, alcohol', child: Text('Yes, alcohol')),
                DropdownMenuItem(value: 'Yes, drugs', child: Text('Yes, drugs')),
                DropdownMenuItem(value: 'Yes, both', child: Text('Yes, both')),
              ],
              decoration: const InputDecoration(
                labelText: 'Select your response',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 2,
        state: _currentStep >= 2 ? StepState.indexed : StepState.disabled,
      ),
      Step(
        title: const Text('Sleep Quality'),
        content: Column(
          children: [
            const Text('How would you rate your sleep quality?'),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _sleepQuality,
              onChanged: (value) => setState(() => _sleepQuality = value!),
              items: const [
                DropdownMenuItem(value: 'Excellent', child: Text('Excellent')),
                DropdownMenuItem(value: 'Good', child: Text('Good')),
                DropdownMenuItem(value: 'Fair', child: Text('Fair')),
                DropdownMenuItem(value: 'Poor', child: Text('Poor')),
                DropdownMenuItem(value: 'Very poor', child: Text('Very poor')),
              ],
              decoration: const InputDecoration(
                labelText: 'Select your sleep quality',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        isActive: _currentStep >= 3,
        state: _currentStep >= 3 ? StepState.indexed : StepState.disabled,
      ),
    ];
  }

  void _onStepContinue() {
    if (_currentStep < _getSteps().length - 1) {
      setState(() => _currentStep++);
    } else {
      // Submit assessment
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Assessment submitted successfully!')),
        );

        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AssessmentResultsScreen(),
          ),
        );*/


      }
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial Assessment'),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          steps: _getSteps(),
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
          onStepTapped: (step) => setState(() => _currentStep = step),
        ),
      ),
    );
  }
}