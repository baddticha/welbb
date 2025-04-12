import 'package:flutter/material.dart';
import 'package:welb/features/community/screens/community_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/uzima_logo.png', height: 40),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 1. Daily Check-In Card
            _buildCheckInCard(),
            const SizedBox(height: 24),

            // 2. Progress Snapshot
            _buildProgressCard(),
            const SizedBox(height: 24),

            // 3. Quick Access
            _buildQuickAccess(),
            const SizedBox(height: 24),

            // 4. Community Highlights
            _buildCommunityPreview(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.insights), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }

  Widget _buildCheckInCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🌞 How are you feeling today?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['😞', '😐', '🙂', '😊', '😄']
                  .map((emoji) => Text(emoji, style: const TextStyle(fontSize: 24)))
                  .toList(),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Quick Journal'),
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
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
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('View Full Report'),
              ),
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

  Widget _buildQuickAccess() {
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
            _buildQuickAccessButton('Emergency Hotline', Icons.emergency),
            _buildQuickAccessButton('Talk to Therapist', Icons.medical_services),
            _buildQuickAccessButton('Breathing Exercise', Icons.self_improvement),
            _buildQuickAccessButton('Safety Plan', Icons.security),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAccessButton(String text, IconData icon) {

    return OutlinedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      onPressed:() {},
    );
  }

  Widget _buildCommunityPreview() {
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
                _buildCommunityPost('Coping with Anxiety Tips'),
                const Divider(),
                _buildCommunityPost('John\'s 90-Day Recovery Story'),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  child: const Text('See More...'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityPost(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}