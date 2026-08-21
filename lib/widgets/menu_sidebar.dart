import 'package:flutter/material.dart';

// Import your existing screen files here
import '../screen/home_screen.dart';
import '../screen/discover_screen.dart';
import '../screen/my_order_screen.dart';
import '../screen/profile_screen.dart';
import '../screen/chat_support_screen.dart';
import '../screen/settings_screen.dart';
import '../screen/about_us_screen.dart';

class MenuSidebar extends StatelessWidget {
  final String selectedMenu;
  final Function(String) onMenuSelected;

  const MenuSidebar({
    super.key,
    this.selectedMenu = 'Homepage',
    required this.onMenuSelected,
  });

  void _navigateToScreen(BuildContext context, String title) {
    onMenuSelected(title);

    Widget targetScreen;

    switch (title) {
      case 'Homepage':
        targetScreen = const Homescreen();
        break;
      case 'Discover':
        targetScreen = const DiscoverScreen();
        break;
      case 'My Order':
        targetScreen = const MyOrderScreen();
        break;
      case 'My profile':
        targetScreen = const ProfileScreen();
        break;
      case 'Chat support':
        targetScreen = const ChatSupportScreen();
        break;
      case 'Setting':
        targetScreen = const SettingsScreen();
        break;
      case 'About us':
        targetScreen = const AboutUsScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => targetScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PROFILE HEADER
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  top: 12,
                  bottom: 28,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF0A5A5),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person,
                              color: Colors.black87,
                              size: 30,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunie Pham',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF17151A),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'sunieux@gmail.com',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF17151A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // MAIN MENU
              _buildMenuItem(
                context,
                icon: Icons.home_outlined,
                title: 'Homepage',
              ),
              _buildMenuItem(
                context,
                icon: Icons.search,
                title: 'Discover',
              ),
              _buildMenuItem(
                context,
                icon: Icons.shopping_bag_outlined,
                title: 'My Order',
              ),
              _buildMenuItem(
                context,
                icon: Icons.person_outline,
                title: 'My profile',
              ),
              _buildMenuItem(
                context,
                icon: Icons.chat_bubble_outline_rounded,
                title: 'Chat support',
              ),

              const SizedBox(height: 24),

              // OTHER SECTION
              const Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  bottom: 14,
                ),
                child: Text(
                  'OTHER',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF777487),
                  ),
                ),
              ),
              _buildMenuItem(
                context,
                icon: Icons.settings_outlined,
                title: 'Setting',
              ),
              _buildMenuItem(
                context,
                icon: Icons.info_outline,
                title: 'About us',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    final bool isSelected = selectedMenu == title;

    return GestureDetector(
      onTap: () => _navigateToScreen(context, title),
      child: Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 5),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F3F5) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? const Color(0xFF202027)
                  : const Color(0xFF858296),
            ),
            const SizedBox(width: 18),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF202027)
                    : const Color(0xFF858296),
              ),
            ),
          ],
        ),
      ),
    );
  }
}