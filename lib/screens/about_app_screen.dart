import 'package:flutter/material.dart';
import 'terms_of_service_screen.dart';
import 'privacy_policy_screen.dart';
import 'licenses_screen.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

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
          'About App',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(Icons.apps, size: 50, color: Color(0xFF1054F3)),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Smart Bill Online', style: TextStyle(color: Color(0xFF081730), fontSize: 22, fontWeight: FontWeight.w700)),
            const Text('Version 1.0.0 (Building 42)', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 48),
            _buildAboutOption(
              context,
              'Terms of Service',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfServiceScreen())),
            ),
            _buildAboutOption(
              context,
              'Privacy Policy',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen())),
            ),
            _buildAboutOption(
              context,
              'Licenses',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LicensesScreen())),
            ),
            const Spacer(),
            const Text('© 2026 SBO Team. All rights reserved.', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutOption(BuildContext context, String title, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFFF5F6FA), borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Color(0xFF081730), fontSize: 16, fontWeight: FontWeight.w600)),
            const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
