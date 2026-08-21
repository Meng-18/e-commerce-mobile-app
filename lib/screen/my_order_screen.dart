import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/menu_sidebar.dart';
import 'notification_screen.dart';
import 'order_detail_screen.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  int selectedIndex = 2;
  int selectedTab = 0;

  final List<String> tabs = [
    'Pending',
    'Delivered',
    'Cancelled',
  ];

  final List<Map<String, dynamic>> pendingOrders = [
    {
      'order': '#1524',
      'tracking': 'IK287368838',
      'quantity': 2,
      'subtotal': '\$110',
      'date': '13/05/2021',
      'status': 'PENDING',
    },
    {
      'order': '#1524',
      'tracking': 'IK2873218897',
      'quantity': 3,
      'subtotal': '\$230',
      'date': '12/05/2021',
      'status': 'PENDING',
    },
    {
      'order': '#1524',
      'tracking': 'IK237368820',
      'quantity': 5,
      'subtotal': '\$490',
      'date': '10/05/2021',
      'status': 'PENDING',
    },
  ];

  final List<Map<String, dynamic>> deliveredOrders = [
    {
      'order': '#1520',
      'tracking': 'IK287368800',
      'quantity': 2,
      'subtotal': '\$150',
      'date': '08/05/2021',
      'status': 'DELIVERED',
    },
    {
      'order': '#1518',
      'tracking': 'IK287368700',
      'quantity': 1,
      'subtotal': '\$80',
      'date': '05/05/2021',
      'status': 'DELIVERED',
    },
  ];

  final List<Map<String, dynamic>> cancelledOrders = [
    {
      'order': '#1515',
      'tracking': 'IK287368600',
      'quantity': 2,
      'subtotal': '\$90',
      'date': '03/05/2021',
      'status': 'CANCELLED',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      // ==========================================
      // SIDEBAR
      // ==========================================
      drawer: MenuSidebar(
        selectedMenu: 'My Order',
        onMenuSelected: (menu) {
          Navigator.pop(context);

          if (menu == 'Homepage') {
            Navigator.pop(context);
          }
        },
      ),

      // ==========================================
      // BODY
      // ==========================================
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            _buildTabs(),

            Expanded(
              child: _buildOrderList(),
            ),
          ],
        ),
      ),

      // ==========================================
      // BOTTOM NAVIGATION
      // ==========================================
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  // ==================================================
  // HEADER
  // ==================================================

  Widget _buildHeader() {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        children: [
          const SizedBox(width: 20),

          // Menu
          Builder(
            builder: (context) {
              return IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.menu,
                  size: 22,
                  color: Color(0xff454148),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),

          const Expanded(
            child: Center(
              child: Text(
                'My Orders',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff202027),
                ),
              ),
            ),
          ),

          // Notification
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_none,
                  size: 24,
                  color: Color(0xff454148),
                ),

                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Color(0xffd94b63),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 22),
        ],
      ),
    );
  }

  // ==================================================
  // TABS
  // ==================================================

  Widget _buildTabs() {
    return Container(
      height: 52,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: List.generate(
          tabs.length,
          (index) {
            final bool isSelected = selectedTab == index;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTab = index;
                  });
                },
                child: Center(
                  child: Container(
                    height: 25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xff4b494c)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xff202027),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ==================================================
  // ORDER LIST
  // ==================================================

  Widget _buildOrderList() {
    List<Map<String, dynamic>> orders;

    if (selectedTab == 0) {
      orders = pendingOrders;
    } else if (selectedTab == 1) {
      orders = deliveredOrders;
    } else {
      orders = cancelledOrders;
    }

    if (orders.isEmpty) {
      return const Center(
        child: Text(
          'No orders found',
          style: TextStyle(
            fontSize: 13,
            color: Color(0xff858296),
          ),
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        16,
        10,
        16,
        20,
      ),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(
          order: orders[index],
        );
      },
    );
  }

  // ==================================================
  // ORDER CARD
  // ==================================================

  Widget _buildOrderCard({
    required Map<String, dynamic> order,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(
        17,
        13,
        10,
        10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // ==========================================
          // ORDER + DATE
          // ==========================================
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Order ${order['order']}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff29262b),
                  ),
                ),
              ),

              SizedBox(
                width: 48,
                child: Text(
                  order['date'],
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 9,
                    height: 1.1,
                    color: Color(0xff858296),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          // ==========================================
          // TRACKING
          // ==========================================
          Row(
            children: [
              const Text(
                'Tracking number:',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xff858296),
                ),
              ),

              const SizedBox(width: 8),

              Text(
                order['tracking'],
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff39353b),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          // ==========================================
          // QUANTITY + SUBTOTAL
          // ==========================================
          Row(
            children: [
              const Text(
                'Quantity:',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xff858296),
                ),
              ),

              const SizedBox(width: 8),

              Text(
                '${order['quantity']}',
                style: const TextStyle(
                  fontSize: 9,
                  color: Color(0xff39353b),
                ),
              ),

              const Spacer(),

              const Text(
                'Subtotal:',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xff858296),
                ),
              ),

              const SizedBox(width: 5),

              Text(
                order['subtotal'],
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff202027),
                ),
              ),
            ],
          ),

          const SizedBox(height: 9),

          // ==========================================
          // STATUS + DETAILS
          // ==========================================
          Row(
            children: [
              Text(
                order['status'],
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                  color: order['status'] == 'PENDING'
                      ? const Color(0xffd97939)
                      : order['status'] == 'DELIVERED'
                          ? const Color(0xff5c936c)
                          : const Color(0xffd95c5c),
                ),
              ),

              const Spacer(),

              // Details button
              SizedBox(
                width: 69,
                height: 26,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailScreen(
                          order: order,
                        ),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: const BorderSide(
                      color: Color(0xff89848d),
                      width: 0.8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 9,
                      color: Color(0xff29262b),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==================================================
  // ORDER DETAILS
  // ==================================================

  void _showOrderDetails(Map<String, dynamic> order) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Order Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              _detailRow(
                'Order number',
                order['order'],
              ),

              _detailRow(
                'Tracking number',
                order['tracking'],
              ),

              _detailRow(
                'Quantity',
                '${order['quantity']}',
              ),

              _detailRow(
                'Subtotal',
                order['subtotal'],
              ),

              _detailRow(
                'Date',
                order['date'],
              ),

              _detailRow(
                'Status',
                order['status'],
              ),

              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Widget _detailRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xff858296),
            ),
          ),

          const Spacer(),

          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff29262b),
            ),
          ),
        ],
      ),
    );
  }
}