import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Beams (Subtle Radial/Custom Beams)
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.4,
              child: Opacity(
                opacity: 0.4,
                child: CustomPaint(
                  painter: _BeamPainter(),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  
                  // Illustration
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow behind the check
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.2),
                              blurRadius: 50,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.successCheck,
                        height: 180,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Success Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Successfull',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Main Heading
                  const Text(
                    'Password Reset Successful',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkBackground,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Subtitle
                  Text(
                    'Click on the login page to sign in with your new password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkBackground.withOpacity(0.5),
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  
                  const Spacer(flex: 3),
                  
                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Pop everything back to Login to ensure a clean state
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                          (route) => false,
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
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Painter for the subtle green beams in the background
class _BeamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppColors.primaryColor.withOpacity(0.3),
          AppColors.lightBackground.withOpacity(0.0),
        ],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final center = Offset(size.width / 2, size.height / 2);
    
    // Draw 8 "beams" or petals to simulate the look in the image
    for (int i = 0; i < 8; i++) {
      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.rotate(i * 3.14159 / 4);
      
      final path = Path()
        ..moveTo(0, 0)
        ..lineTo(-200, -800) // Reaching upwards and outwards
        ..lineTo(200, -800)
        ..close();
        
      canvas.drawPath(path, paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
