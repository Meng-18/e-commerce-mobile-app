import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 4,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // ==========================================
              // MENU
              // ==========================================
              Builder(
                builder: (context) {
                  return IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.menu,
                      size: 22,
                      color: Color(0xFF202027),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),

              // ==========================================
              // CENTER TITLE
              // ==========================================
              const Expanded(
                child: Center(
                  child: Text(
                    'GenStore',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // ==========================================
              // NOTIFICATION
              // ==========================================
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationScreen(),
                    ),
                  );
                },
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 25,
                      color: Color(0xFF202027),
                    ),

                    // Notification badge
                    Positioned(
                      right: -1,
                      top: -1,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==========================================
// NOTIFICATION SCREEN
// ==========================================

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF202027),
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _notificationItem(
            icon: Icons.local_offer_outlined,
            title: 'Special Offer',
            message: 'Get up to 30% off on selected products.',
            time: '2 min ago',
          ),

          _notificationItem(
            icon: Icons.shopping_bag_outlined,
            title: 'Order Update',
            message: 'Your order has been successfully confirmed.',
            time: '1 hour ago',
          ),

          _notificationItem(
            icon: Icons.favorite_border,
            title: 'New Collection',
            message: 'Check out our latest fashion collection.',
            time: '3 hours ago',
          ),
        ],
      ),
    );
  }

  Widget _notificationItem({
    required IconData icon,
    required String title,
    required String message,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F3F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 21,
              color: const Color(0xFF202027),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF858296),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFFAAA7B2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}