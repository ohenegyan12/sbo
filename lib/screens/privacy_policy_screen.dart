import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('1. Information Collection', 'We collect information you provide directly to us, such as when you create an account, make a purchase, or contact support. This includes your name, email, and phone number.'),
            _buildSection('2. How We Use Information', 'We use your information to process transactions, provide and improve our services, communicate with you, and ensure security.'),
            _buildSection('3. Data Sharing', 'We do not sell your personal data. We only share information with third-party service providers (like payment processors) necessary to complete your requests.'),
            _buildSection('4. Data Security', 'We implement industry-standard security measures to protect your data. However, no method of transmission over the internet is 100% secure.'),
            _buildSection('5. Your Rights', 'You have the right to access, update, or delete your personal information. You can do this through your profile settings or by contacting support.'),
            const SizedBox(height: 40),
            Text(
              'Last Updated: March 2026',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF081730),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              color: const Color(0xFF081730).withOpacity(0.6),
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
