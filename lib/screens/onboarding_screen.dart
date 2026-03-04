import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Text Content
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Purchase\n',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: 'Subscriptions\nWith Ease',
                      style: TextStyle(
                        color: AppColors.darkBackground,
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Purchase and manage all your\nsubscriptions with ease',
                style: TextStyle(
                  color: AppColors.darkBackground.withOpacity(0.5),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              // Illustration (Centered)
              const Spacer(),
              Center(
                child: SvgPicture.asset(
                  AppAssets.onboardingIllustration,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
              ),
              const Spacer(),
              
              // Bottom Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
