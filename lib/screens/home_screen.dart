import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0, bottom: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Good Morning, Satya!',
                          style: TextStyle(
                            color: AppColors.darkBackground,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'What are you doing today?',
                          style: TextStyle(
                            color: AppColors.darkBackground.withOpacity(0.4),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    
                    // Notification Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6FA),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            '2 New',
                            style: TextStyle(
                              color: AppColors.darkBackground,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Icon(Icons.notifications_outlined, size: 24, color: AppColors.darkBackground),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Subscription Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF081730), // Dark Navy
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Current Subscription',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'No Current\nSubscriptions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Last Updated: 03 March 2026',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // View Button
                      SizedBox(
                        width: double.infinity,
                        height: 64,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF03A1E9), // Cyan Blue
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'View Available Subscriptions',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Quick Actions Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Quick Actions',
                  style: TextStyle(
                    color: AppColors.darkBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildActionCard(
                        icon: AppAssets.purchaseSubscription,
                        label: 'Purchase\nSubscription',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildActionCard(
                        icon: AppAssets.contactSupport,
                        label: 'Contact\nSupport',
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Transactions Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Transactions',
                  style: TextStyle(
                    color: AppColors.darkBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              _buildTransactionItem(
                title: 'DSTV Subscription',
                subtitle: '10:44 AM - Jun 27, 2024',
                amount: 'GHS 250.00',
                imagePath: AppAssets.dstvLogo,
              ),
              _buildTransactionItem(
                title: 'MTN Data Purchase',
                subtitle: '10:44 AM - Jun 27, 2024',
                amount: 'GHS 250.00',
                imagePath: AppAssets.mtnLogo,
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      extendBody: true,
      bottomNavigationBar: _buildFloatingBottomNav(),
    );
  }

  int _selectedIndex = 0;

  Widget _buildFloatingBottomNav() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, AppAssets.home, 'Home'),
          _buildNavItem(1, AppAssets.subscriptions, 'Subscription'),
          _buildNavItem(2, AppAssets.transaction, 'Transaction'),
          _buildNavItem(3, AppAssets.profile, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    bool isSelected = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : Colors.grey.shade500,
                BlendMode.srcIn,
              ),
            ),
            if (isSelected) 
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }


  Widget _buildActionCard({required String icon, required String label}) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF081730),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          const BoxShadow(
            color: Color(0xFF1054F3),
            offset: Offset(0, -4),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            height: 32,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const Spacer(),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        children: [
          // Transaction Logo
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          // Transaction Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF081730),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0xFF081730).withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Amount
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFF081730),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
