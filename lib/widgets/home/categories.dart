import 'package:flutter/material.dart';
import 'package:e_commerce_mobile_app/screen/product/products_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Women',
      'icon': Icons.female,
    },
    {
      'name': 'Men',
      'icon': Icons.male,
    },
    {
      'name': 'Accessories',
      'icon': Icons.watch_outlined,
    },
    {
      'name': 'Beauty',
      'icon': Icons.face_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(
                    category: category['name'],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Icon(
                    category['icon'],
                    size: 17,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  category['name'],
                  style: const TextStyle(
                    fontSize: 7,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}