import 'package:flutter/material.dart';
import 'package:welb/features/community/screens/community_screen.dart';
import 'package:welb/features/recovery/screens/recovery_dashboard.dart';
import 'package:welb/features/chatbot/screens/initial_assessment.dart';
import 'package:welb/features/recovery/screens/recovery_history.dart';
import 'package:welb/features/recovery/screens/recovery_analytics.dart';
import 'package:welb/features/emergency/screens/emergency_hotline_screen.dart';
import 'package:welb/features/wellness/screens/breathing_exercise_screen.dart';
import 'package:welb/features/safety/screens/safety_plan_screen.dart';
import 'package:welb/features/assessment/screens/daily_assessment_screen.dart';
import 'package:welb/features/assessment/screens/assessment_results_screen.dart';
import 'package:welb/features/assessment/models/wellness_assessment.dart';
import 'package:welb/features/profile/screens/profile_screen.dart';
// Import other screens as needed

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Define your pages/screens here
  final List<Widget> _pages = [
    const HomePageContent(), // Replace with your actual Home screen content
    const CommunityScreen(),
    const RecoveryDashboard(), // Replace with your actual Track screen
    const ProfileScreen(),   // Replace InitialAssessmentScreen with ProfileScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/uzima_logo.png', height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          )
        ],
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}

// Replace this with your actual Home screen content
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 1. Daily Check-In Card
          _buildCheckInCard(context),
          const SizedBox(height: 24),

          // 2. Progress Snapshot
          _buildProgressCard(context),
          const SizedBox(height: 24),

          // 3. Quick Access
          _buildQuickAccess(context),
          const SizedBox(height: 24),

          // 4. Community Highlights
          _buildCommunityPreview(context),
        ],
      ),
    );
  }

  Widget _buildCheckInCard(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DailyAssessmentScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🌞 How are you feeling today?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['😞', '😐', '🙂', '😊', '😄']
                    .map((emoji) => Text(emoji, style: const TextStyle(fontSize: 28)))
                    .toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tap anywhere to start your daily wellness check',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Start Assessment'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DailyAssessmentScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🏆 Your Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildProgressItem('🔥 7-Day Sober Streak'),
            _buildProgressItem('📈 Mood Trend: ↗️ 22% Improvement'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RecoveryAnalyticsScreen()),
                    );
                  },
                  child: const Text('View Full Report'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssessmentResultsScreen(
                          assessment: WellnessAssessment.empty(),
                        ),
                      ),
                    );
                  },
                  child: const Text('View Assessment History'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            '🆘 Quick Access',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            _buildQuickAccessButton('Emergency Hotline', Icons.emergency, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyHotlineScreen()),
              );
            }),
            _buildQuickAccessButton('Talk to Therapist', Icons.medical_services, () {
              // TODO: Implement therapist chat
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Therapist chat coming soon')),
              );
            }),
            _buildQuickAccessButton('Breathing Exercise', Icons.self_improvement, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BreathingExerciseScreen()),
              );
            }),
            _buildQuickAccessButton('Safety Plan', Icons.security, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SafetyPlanScreen()),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAccessButton(String text, IconData icon, VoidCallback onPressed) {
    return OutlinedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      onPressed: onPressed,
    );
  }

  Widget _buildCommunityPreview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            '💬 Community Highlights',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildCommunityPost('Coping with Anxiety Tips', () {
                  // TODO: Navigate to post detail
                }),
                const Divider(),
                _buildCommunityPost('John\'s 90-Day Recovery Story', () {
                  // TODO: Navigate to post detail
                }),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CommunityScreen()),
                    );
                  },
                  child: const Text('See More...'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityPost(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

// Other widget methods remain the same
// ...



}