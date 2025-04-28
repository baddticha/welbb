import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyHotlineScreen extends StatelessWidget {
  const EmergencyHotlineScreen({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Hotlines'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Emergency Services',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildEmergencyCard(
              'National Suicide Prevention Lifeline',
              '988',
              'Available 24/7 for emotional support',
              Icons.phone,
              () => _makePhoneCall('988'),
            ),
            const SizedBox(height: 16),
            _buildEmergencyCard(
              'Crisis Text Line',
              'Text HOME to 741741',
              '24/7 crisis counseling via text message',
              Icons.message,
              () => _makePhoneCall('741741'),
            ),
            const SizedBox(height: 16),
            _buildEmergencyCard(
              'SAMHSA National Helpline',
              '1-800-662-4357',
              'Treatment referral and information service',
              Icons.medical_services,
              () => _makePhoneCall('18006624357'),
            ),
            const SizedBox(height: 16),
            _buildEmergencyCard(
              'National Domestic Violence Hotline',
              '1-800-799-7233',
              '24/7 support for domestic violence',
              Icons.security,
              () => _makePhoneCall('18007997233'),
            ),
            const SizedBox(height: 30),
            const Text(
              'Local Resources',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildResourceCard(
              'Nearest Hospital',
              'Find the closest emergency room',
              Icons.local_hospital,
              () {
                // TODO: Implement location services to find nearest hospital
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Finding nearest hospital...')),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildResourceCard(
              'Emergency Contacts',
              'View your saved emergency contacts',
              Icons.contacts,
              () {
                // TODO: Implement emergency contacts list
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Loading emergency contacts...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyCard(
    String title,
    String number,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.red, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          number,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResourceCard(
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.blue, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 