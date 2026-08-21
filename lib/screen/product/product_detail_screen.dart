import 'package:flutter/material.dart';
import '../../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 2; // Default selected size 'L'
  bool isFavorite = true;

  final List<Color> colors = [
    const Color(0xFFE4C3AD),
    Colors.black,
    const Color(0xFFE07A70),
  ];

  final List<String> sizes = ['S', 'M', 'L'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Product Header / Image Container
                Stack(
                  children: [
                    Container(
                      height: 480,
                      width: double.infinity,
                      color: const Color(0xFFF2ECE7),
                      child: ClipRRect(
                        child: Image.network(
                          widget.product.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFF2ECE7),
                              child: const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Floating Action Buttons (Back & Favorite)
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCircularButton(
                              icon: Icons.arrow_back_ios_new,
                              iconSize: 16,
                              onPressed: () => Navigator.pop(context),
                            ),
                            _buildCircularButton(
                              icon: isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              iconColor: isFavorite
                                  ? Colors.redAccent
                                  : Colors.black,
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Page Indicator Dots
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(isActive: true),
                          _buildDot(isActive: false),
                          _buildDot(isActive: false),
                        ],
                      ),
                    ),
                  ],
                ),

                // Bottom Content Sheet
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Price Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name.isNotEmpty
                                  ? widget.product.name
                                  : 'Sportwear Set',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            widget.product.price.isNotEmpty
                                ? widget.product.price
                                : '\$ 80.00',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Ratings Row
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: Color(0xFF5E8A75),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            '(83)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Color and Size Selectors Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Color Options
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Color',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: List.generate(
                                    colors.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 12),
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: selectedColorIndex == index
                                              ? Border.all(
                                                  color: Colors.grey.shade400,
                                                  width: 1,
                                                )
                                              : null,
                                        ),
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: colors[index],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Size Options
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Size',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: List.generate(
                                    sizes.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSizeIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: selectedSizeIndex == index
                                              ? const Color(0xFF4A4A4A)
                                              : const Color(0xFFFAFAFA),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            sizes[index],
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: selectedSizeIndex == index
                                                  ? Colors.white
                                                  : Colors.black45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Expandable List items
                      _buildExpandableTile('Description'),
                      const Divider(height: 1, color: Color(0xFFEEEEEE)),
                      _buildExpandableTile('Reviews'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Fixed Add to Cart Button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 25),
              color: Colors.white,
              child: SizedBox(
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${widget.product.name} added to cart',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF333333),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularButton({
    required IconData icon,
    required VoidCallback onPressed,
    double iconSize = 18,
    Color iconColor = Colors.black,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: iconSize, color: iconColor),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 8 : 5,
      height: isActive ? 8 : 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.black26,
      ),
    );
  }

  Widget _buildExpandableTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Colors.black87,
            size: 20,
          ),
        ],
      ),
    );
  }
}