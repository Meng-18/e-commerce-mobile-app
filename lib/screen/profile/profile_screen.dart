import 'package:flutter/material.dart';

import '../../widgets/navigation/bottom_navigation.dart';
import '../../widgets/navigation/menu_sidebar.dart';
import '../notification/notification_screen.dart';
import 'package:e_commerce_mobile_app/screen/profile/personal_information_screen.dart';
import 'package:e_commerce_mobile_app/screen/profile/my_address_screen.dart';
import 'package:e_commerce_mobile_app/screen/auth/password_screen.dart';
import 'package:e_commerce_mobile_app/screen/payment/payment_methods_screen.dart';
import 'package:e_commerce_mobile_app/screen/profile/settings_screen.dart';
import 'package:e_commerce_mobile_app/screen/support/help_support_screen.dart';
import 'package:e_commerce_mobile_app/screen/support/about_us_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 4;

  String selectedMenu = 'My profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),


      // ==========================================
      // BODY
      // ==========================================
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  25,
                ),
                child: Column(
                  children: [
                    _buildProfile(),

                    const SizedBox(height: 25),

                    _buildAccountSection(context),

                    const SizedBox(height: 20),

                    _buildOtherSection(context),
                  ],
                ),
              ),
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

          // Title
          const Expanded(
            child: Center(
              child: Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff202027),
                ),
              ),
            ),
          ),

          const SizedBox(width: 22),
        ],
      ),
    );
  }

  // ==================================================
  // PROFILE
  // ==================================================

  Widget _buildProfile() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile image
          Container(
            width: 85,
            height: 85,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xfff0a5a5),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            'Sunie Pham',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xff202027),
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'sunieux@gmail.com',
            style: TextStyle(
              fontSize: 11,
              color: Color(0xff858296),
            ),
          ),

          const SizedBox(height: 18),

          // Edit profile button
          SizedBox(
            height: 35,
            width: 125,
            child: OutlinedButton(
              onPressed: () {
                _showEditProfile();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xff858296),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff202027),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
// ==================================================
// ACCOUNT SECTION
// ==================================================

Widget _buildAccountSection(BuildContext context) {
  return _buildSection(
    title: 'ACCOUNT',
    children: [
      _buildProfileItem(
        icon: Icons.person_outline,
        title: 'Personal Information',
        subtitle: 'Name, email and phone',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonalInformationScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.location_on_outlined,
        title: 'My Address',
        subtitle: 'Manage your delivery address',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyAddressScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.lock_outline,
        title: 'Password',
        subtitle: 'Change your password',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PasswordScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.payment_outlined,
        title: 'Payment Methods',
        subtitle: 'Manage your payment methods',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentMethodsScreen(),
            ),
          );
        },
      ),
    ],
  );
}

// ==================================================
// OTHER SECTION
// ==================================================

Widget _buildOtherSection(BuildContext context) {
  return _buildSection(
    title: 'OTHER',
    children: [
      _buildProfileItem(
        icon: Icons.settings_outlined,
        title: 'Settings',
        subtitle: 'App preferences',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.help_outline,
        title: 'Help & Support',
        subtitle: 'Get help with your account',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpSupportScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.info_outline,
        title: 'About us',
        subtitle: 'About GenStore',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AboutUsScreen(),
            ),
          );
        },
      ),

      _buildProfileItem(
        icon: Icons.logout,
        title: 'Logout',
        subtitle: 'Sign out of your account',
        isLogout: true,
        onTap: () {
          _showLogoutDialog();
        },
      ),
    ],
  );
}

  // ==================================================
  // SECTION
  // ==================================================

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 15,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              bottom: 5,
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xff858296),
              ),
            ),
          ),

          ...children,
        ],
      ),
    );
  }

  // ==================================================
  // PROFILE ITEM
  // ==================================================

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 12,
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isLogout
                    ? const Color(0xfffff2f2)
                    : const Color(0xfff7f3f5),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(
                icon,
                size: 19,
                color: isLogout
                    ? const Color(0xffd95c5c)
                    : const Color(0xff6f6a76),
              ),
            ),

            const SizedBox(width: 13),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isLogout
                          ? const Color(0xffd95c5c)
                          : const Color(0xff39353b),
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 9,
                      color: Color(0xffaaa6b0),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right,
              size: 18,
              color: Color(0xffaaa6b0),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================
  // EDIT PROFILE
  // ==================================================

  void _showEditProfile() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            top: 25,
            bottom: MediaQuery.of(context).viewInsets.bottom + 25,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff202027),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==================================================
  // MESSAGE
  // ==================================================

  void _showMessage(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  // ==================================================
  // LOGOUT
  // ==================================================

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out'),
                  ),
                );
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}