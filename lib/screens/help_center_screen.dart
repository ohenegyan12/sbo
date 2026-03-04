import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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
          'Help Center',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildFaqItem('How do I purchase a subscription?', 'Navigate to the Home or Subscription tab and click on Purchase Subscription.'),
          _buildFaqItem('Can I cancel a payment?', 'Once a transaction is finalized, it cannot be reversed. Please contact support for help.'),
          _buildFaqItem('My transaction failed but I was charged', 'In case of a technical error, refunds are processed within 24 hours.'),
          const SizedBox(height: 32),
          const Text('Still need help?', style: TextStyle(color: Color(0xFF081730), fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          _buildContactButton(Icons.mail_outline, 'Email Support', 'support@example.com'),
        ],
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question, style: const TextStyle(color: Color(0xFF081730), fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(answer, style: TextStyle(color: const Color(0xFF081730).withOpacity(0.5), fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryColor),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Color(0xFF081730), fontSize: 14, fontWeight: FontWeight.w700)),
              Text(subtitle, style: TextStyle(color: const Color(0xFF081730).withOpacity(0.5), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
