import 'package:flutter/material.dart';
import 'package:e_commerce_mobile_app/models/product.dart';
import 'package:e_commerce_mobile_app/screen/product/product_detail_screen.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'White Fashion Hoodie',
      'price': '\$29.00',
      'image':
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?auto=format&fit=crop&w=300&q=80',
    },
    {
      'name': 'Cotton T-shirt',
      'price': '\$30.00',
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=300&q=80',
    },
    {
      'name': 'Casual Shirt',
      'price': '\$35.00',
      'image':
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?auto=format&fit=crop&w=300&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Section title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const Spacer(),

              Text(
                'Show all',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Products
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final productData = products[index];

              return GestureDetector(
                onTap: () {
                  // Map Map<String, String> to your Product model
                  final product = Product(
                    name: productData['name']!,
                    price: productData['price']!,
                    image: productData['image']!,
                    category: 'Recommended',
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: Container(
                  width: 145,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        child: Image.network(
                          productData['image']!,
                          width: 55,
                          height: 65,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 55,
                              height: 65,
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.image_outlined,
                                color: Colors.grey,
                                size: 18,
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData['name']!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              productData['price']!,
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}