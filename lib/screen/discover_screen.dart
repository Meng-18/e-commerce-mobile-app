import 'package:e_commerce_mobile_app/widgets/filter_button.dart';
import 'package:flutter/material.dart';

import '../widgets/home_header.dart';
import '../widgets/menu_sidebar.dart';
import '../widgets/bottom_navigation.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController searchController =
      TextEditingController();

  int selectedIndex = 1;

  final List<Map<String, dynamic>> clothingItems = [
    {
      'name': 'Jacket',
      'items': '128 items',
    },
    {
      'name': 'Skirts',
      'items': '40 items',
    },
    {
      'name': 'Dresses',
      'items': '36 items',
    },
    {
      'name': 'Sweaters',
      'items': '24 items',
    },
    {
      'name': 'Jeans',
      'items': '14 items',
    },
    {
      'name': 'T-Shirts',
      'items': '12 items',
    },
    {
      'name': 'Pants',
      'items': '9 items',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaf8f8),

      // ==========================================
      // SIDEBAR
      // ==========================================
      drawer: MenuSidebar(
        selectedMenu: 'Discover',
        onMenuSelected: (menu) {
          Navigator.pop(context);

          // Add navigation here later if needed
          print('Selected menu: $menu');
        },
      ),

      // ==========================================
      // BODY
      // ==========================================
      body: Column(
        children: [
          // ==========================================
          // HOME HEADER
          // ==========================================
          const HomeHeader(
            title: 'Discover',
          ),

          // ==========================================
          // CONTENT
          // ==========================================
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 29,
                right: 29,
                top: 12,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search
                  _buildSearchBar(),

                  const SizedBox(height: 13),

                  // Clothing
                  _buildCategoryCard(
                    title: 'CLOTHING',
                    image: 'assets/images/clothing.png',
                    backgroundColor: const Color(0xffaaa99d),
                  ),

                  const SizedBox(height: 14),

                  // Clothing list
                  _buildClothingList(),

                  const SizedBox(height: 10),

                  // Accessories
                  _buildCategoryCard(
                    title: 'ACCESSORIES',
                    image: 'assets/images/accessories.png',
                    backgroundColor: const Color(0xff918b8b),
                  ),

                  const SizedBox(height: 13),

                  // Shoes
                  _buildCategoryCard(
                    title: 'SHOES',
                    image: 'assets/images/shoes.png',
                    backgroundColor: const Color(0xff536068),
                  ),

                  const SizedBox(height: 13),

                  // Collection
                  _buildCategoryCard(
                    title: 'COLLECTION',
                    image: 'assets/images/collection.png',
                    backgroundColor: const Color(0xffb9adaf),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
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
  // SEARCH BAR
  // ==================================================

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xffeee9eb),
                width: 1,
              ),
            ),
            child: TextField(
              controller: searchController,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xff55515a),
              ),
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 10,
                  color: Color(0xff77727d),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                  color: Color(0xff85808d),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 9),

        // Filter button
        const FilterButton(),
      ],
    );
  }

  // ==================================================
  // CATEGORY CARD
  // ==================================================

  Widget _buildCategoryCard({
    required String title,
    required String image,
    required Color backgroundColor,
  }) {
    return Container(
      height: 87,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(11),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Decorative circle
          Positioned(
            right: 25,
            top: 10,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Image
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: SizedBox(
              width: 115,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox();
                },
              ),
            ),
          ),

          // Title
          Positioned(
            left: 15,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==================================================
  // CLOTHING LIST
  // ==================================================

  Widget _buildClothingList() {
    return Column(
      children: clothingItems.map((item) {
        return Container(
          height: 38,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Color(0xffeee9eb),
                width: 0.7,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  item['name'],
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff5d5961),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Text(
                item['items'],
                style: const TextStyle(
                  fontSize: 8,
                  color: Color(0xffb4afb5),
                ),
              ),

              const SizedBox(width: 6),

              const Icon(
                Icons.chevron_right,
                size: 16,
                color: Color(0xff29262b),
              ),

              const SizedBox(width: 7),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ==================================================
  // FILTER
  // ==================================================

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              _filterOption('Newest'),
              _filterOption('Popular'),
              _filterOption('Price: Low to High'),
              _filterOption('Price: High to Low'),

              const SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  Widget _filterOption(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xff454148),
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        size: 18,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}