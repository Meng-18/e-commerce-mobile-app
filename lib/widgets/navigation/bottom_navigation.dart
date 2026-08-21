import 'package:e_commerce_mobile_app/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../screen/home/home_screen.dart';
import '../../screen/home/discover_screen.dart';
import '../../screen/order/my_order_screen.dart';
import '../../screen/profile/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 0.8,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // =========================
          // HOME
          // =========================
          _navItem(
            context: context,
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            index: 0,
            page: const Homescreen(),
          ),

          // =========================
          // SEARCH
          // =========================
          _navItem(
            context: context,
            icon: Icons.search_outlined,
            activeIcon: Icons.search,
            label: 'Search',
            index: 1,
            page: const DiscoverScreen(),
          ),

          // =========================
          // BAG
          // =========================
          _navItem(
            context: context,
            icon: Icons.shopping_bag_outlined,
            activeIcon: Icons.shopping_bag,
            label: 'Bag',
            index: 2,
            page: const MyOrderScreen(),
          ),

          // =========================
          // CART
          // =========================
          _navItem(
            context: context,
            icon: Icons.shopping_cart_outlined,
            activeIcon: Icons.shopping_cart,
            label: 'Cart',
            index: 3,
            page: const CartScreen(),
          ),

          // =========================
          // PROFILE
          // =========================
          _navItem(
            context: context,
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            index: 4,
            page: const ProfileScreen(),
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required BuildContext context,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required Widget page,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);

        // Don't push the same page again
        if (selectedIndex == index) {
          return;
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              size: 20,
              color: isSelected
                  ? Colors.black87
                  : Colors.grey.shade400,
            ),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                fontSize: 7,
                fontWeight: isSelected
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: isSelected
                    ? Colors.black87
                    : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}