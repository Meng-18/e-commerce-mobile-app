import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      // ==========================================
      // APP BAR
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF202027),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF202027),
          ),
        ),
      ),

      // ==========================================
      // NOTIFICATION LIST
      // ==========================================
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildNotification(
            icon: Icons.local_offer_outlined,
            title: 'Special Offer',
            message: 'Get up to 30% off on selected products.',
            time: '2 min ago',
            isUnread: true,
          ),

          _buildNotification(
            icon: Icons.shopping_bag_outlined,
            title: 'Order Update',
            message: 'Your order has been successfully confirmed.',
            time: '1 hour ago',
            isUnread: true,
          ),

          _buildNotification(
            icon: Icons.favorite_border,
            title: 'New Collection',
            message: 'Check out our latest fashion collection.',
            time: '3 hours ago',
            isUnread: false,
          ),

          _buildNotification(
            icon: Icons.local_shipping_outlined,
            title: 'Order Shipped',
            message: 'Your order is on the way.',
            time: 'Yesterday',
            isUnread: false,
          ),

          _buildNotification(
            icon: Icons.discount_outlined,
            title: 'New Discount',
            message: 'A new discount is available for you.',
            time: 'Yesterday',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  // ==========================================
  // NOTIFICATION ITEM
  // ==========================================
  Widget _buildNotification({
    required IconData icon,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // ICON
          // ==========================================
          Container(
            width: 44,
            height: 44,

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

          // ==========================================
          // CONTENT
          // ==========================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF202027),
                        ),
                      ),
                    ),

                    // Unread indicator
                    if (isUnread)
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 5),

                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF858296),
                  ),
                ),

                const SizedBox(height: 7),

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