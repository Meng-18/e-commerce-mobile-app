import 'package:flutter/material.dart';

import '../../widgets/home/home_header.dart';
import '../../widgets/navigation/menu_sidebar.dart';
import '../../widgets/home/categories.dart';
import '../../widgets/home/fashion_banner.dart';
import '../../widgets/home/feature_products.dart';
import '../../widgets/home/new_collection.dart';
import '../../widgets/home/recommended.dart';
import '../../widgets/home/top_collection.dart';
import '../../widgets/home/small_collections.dart';
import '../../widgets/navigation/bottom_navigation.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int selectedIndex = 0;

  // Selected sidebar menu
  String selectedMenu = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      // ==========================================
      // SIDEBAR MENU
      // ==========================================
      drawer: MenuSidebar(
        selectedMenu: selectedMenu,
        onMenuSelected: (menu) {
          setState(() {
            selectedMenu = menu;
          });

          // Close sidebar
          Navigator.pop(context);

          // You can add navigation later
          print('Selected menu: $menu');
        },
      ),

      // ==========================================
      // BODY
      // ==========================================
      body: Stack(
        children: [
          // Scrollable Home Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                top: 65,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // Categories
                  Categories(),

                  // Fashion Banner
                  FashionBanner(),

                  // Feature Products
                  FeatureProducts(),

                  // New Collection
                  NewCollection(),

                  // Recommended
                  Recommended(),

                  // Top Collection
                  TopCollection(),

                  // Small Collections
                  SmallCollections(),

                  SizedBox(height: 80),
                ],
              ),
            ),
          ),

          // ==========================================
          // FIXED HEADER
          // ==========================================
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomeHeader(title: '',),
          ),
        ],
      ),

      // ==========================================
      // FIXED BOTTOM NAVIGATION
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
}