import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class NotificationItem {
  final String title;
  final String body;
  final String time;
  final bool isRead;
  final IconData icon;
  final Color iconColor;

  NotificationItem({
    required this.title,
    required this.body,
    required this.time,
    this.isRead = false,
    required this.icon,
    required this.iconColor,
  });
}

class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NotificationItem> notifications = [
      NotificationItem(
        title: 'Subscription Expiring soon',
        body: 'Your DSTV Compact Plus subscription will expire in 2 days. Renew now to avoid interruption.',
        time: '2 mins ago',
        isRead: false,
        icon: Icons.warning_amber_rounded,
        iconColor: Colors.orange,
      ),
      NotificationItem(
        title: 'Payment Successful',
        body: 'You successfully renewed your DSTV Compact subscription.',
        time: '1 hour ago',
        isRead: false,
        icon: Icons.check_circle_outline_rounded,
        iconColor: Colors.green,
      ),
      NotificationItem(
        title: 'New Feature Alert',
        body: 'You can now set up auto-renewal for your favorite packages!',
        time: 'Yesterday',
        isRead: true,
        icon: Icons.star_outline_rounded,
        iconColor: AppColors.primaryColor,
      ),
      NotificationItem(
        title: 'Account Update',
        body: 'Your profile information has been successfully updated.',
        time: '2 days ago',
        isRead: true,
        icon: Icons.person_outline_rounded,
        iconColor: Colors.blue,
      ),
    ];

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
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Mark all as read logic
            },
            child: const Text(
              'Mark all read',
              style: TextStyle(
                color: Color(0xFF1054F3),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
        centerTitle: false,
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade100,
                indent: 80,
                endIndent: 24,
              ),
              itemBuilder: (context, index) => _buildNotificationTile(notifications[index]),
            ),
    );
  }

  Widget _buildNotificationTile(NotificationItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: item.iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        color: const Color(0xFF081730),
                        fontSize: 16,
                        fontWeight: item.isRead ? FontWeight.w600 : FontWeight.w700,
                      ),
                    ),
                    if (!item.isRead)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1054F3),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item.body,
                  style: TextStyle(
                    color: const Color(0xFF081730).withOpacity(0.5),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.time,
                  style: TextStyle(
                    color: const Color(0xFF081730).withOpacity(0.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_none_rounded, size: 80, color: Colors.grey.shade200),
          const SizedBox(height: 16),
          const Text(
            'No notifications yet',
            style: TextStyle(
              color: Color(0xFF081730),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'We\'ll notify you when something important happens.',
            style: TextStyle(
              color: const Color(0xFF081730).withOpacity(0.4),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
