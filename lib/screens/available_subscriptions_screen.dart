import 'package:flutter/material.dart';
import 'purchase_subscription_screen.dart';
import 'select_package_screen.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';

class Subscription {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final String logoPath;
  final bool logoIsCircle;
  final SubscriptionType type;

  Subscription({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.logoPath,
    required this.logoIsCircle,
    required this.type,
  });
}

class AvailableSubscriptionsScreen extends StatefulWidget {
  const AvailableSubscriptionsScreen({super.key});

  @override
  State<AvailableSubscriptionsScreen> createState() => _AvailableSubscriptionsScreenState();
}

class _AvailableSubscriptionsScreenState extends State<AvailableSubscriptionsScreen> {
  final List<Subscription> _allSubscriptions = [
    Subscription(
      title: 'Purchase DSTV\nSubscription',
      subtitle: 'Purchase',
      backgroundColor: const Color(0xFF03A1E9), // Cyan
      logoPath: AppAssets.dstvLogo,
      logoIsCircle: false,
      type: SubscriptionType.dstv,
    ),
  ];

  late List<Subscription> _filteredSubscriptions;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredSubscriptions = _allSubscriptions;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredSubscriptions = _allSubscriptions
          .where((sub) => sub.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          'Available Subscriptions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  hintText: 'Search Subscriptions',
                  hintStyle: TextStyle(
                    color: AppColors.darkBackground.withOpacity(0.3),
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.darkBackground.withOpacity(0.3),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
            ),
            
            // Subscriptions List
            Expanded(
              child: _filteredSubscriptions.isEmpty
                  ? Center(
                      child: Text(
                        'No packages found',
                        style: TextStyle(
                          color: AppColors.darkBackground.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _filteredSubscriptions.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final sub = _filteredSubscriptions[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SelectPackageScreen(type: sub.type),
                              ),
                            );
                          },
                          child: _buildSubscriptionCard(sub),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(Subscription sub) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: sub.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sub.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  sub.subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Logo Container
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: sub.logoIsCircle ? const Color(0xFFFFCC00) : Colors.white,
              shape: sub.logoIsCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: sub.logoIsCircle ? null : BorderRadius.circular(8),
            ),
            child: Image.asset(
              sub.logoPath,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
