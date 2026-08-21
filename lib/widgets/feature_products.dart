import 'package:e_commerce_mobile_app/screen/model/product.dart';
import 'package:e_commerce_mobile_app/screen/product_detail_screen.dart'; // Import product detail screen
import 'package:flutter/material.dart';

class FeatureProducts extends StatelessWidget {
  const FeatureProducts({super.key});

  static const List<Product> products = [
    // ==================== WOMEN ====================
    Product(
      name: 'Turtleneck Sweater',
      price: '\$39.99',
      category: 'Women',
      image:
          'https://images.unsplash.com/photo-1591369822096-ffd140ec948f?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Long Sleeve Dress',
      price: '\$45.00',
      category: 'Women',
      image:
          'https://images.unsplash.com/photo-1572804013427-4d7ca7268217?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Women Sportswear',
      price: '\$80.00',
      category: 'Women',
      image:
          'https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&w=400&q=80',
    ),

    // ==================== MEN ====================
    Product(
      name: 'Men Casual Shirt',
      price: '\$35.00',
      category: 'Men',
      image:
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Men Jacket',
      price: '\$65.00',
      category: 'Men',
      image:
          'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Men T-Shirt',
      price: '\$25.00',
      category: 'Men',
      image:
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=400&q=80',
    ),

    // ==================== ACCESSORIES ====================
    Product(
      name: 'Leather Handbag',
      price: '\$55.00',
      category: 'Accessories',
      image:
          'https://images.unsplash.com/photo-1584917865442-de89df76afd3?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Classic Watch',
      price: '\$75.00',
      category: 'Accessories',
      image:
          'https://images.unsplash.com/photo-1524805444758-089113d48a6d?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Fashion Sunglasses',
      price: '\$30.00',
      category: 'Accessories',
      image:
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?auto=format&fit=crop&w=400&q=80',
    ),

    // ==================== BEAUTY ====================
    Product(
      name: 'Beauty Makeup Set',
      price: '\$42.00',
      category: 'Beauty',
      image:
          'https://images.unsplash.com/photo-1596462502278-27bfdc403348?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Cosmetic Set',
      price: '\$38.00',
      category: 'Beauty',
      image:
          'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?auto=format&fit=crop&w=400&q=80',
    ),

    Product(
      name: 'Perfume',
      price: '\$60.00',
      category: 'Beauty',
      image:
          'https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&w=400&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),

        const SizedBox(height: 10),

        SizedBox(
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(product: product),
                    ),
                  );
                },
                child: Container(
                  width: 103,
                  margin: const EdgeInsets.only(right: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(
                          product.image,
                          width: 103,
                          height: 125,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 103,
                              height: 125,
                              color: Colors.grey.shade200,
                              child: const Icon(
                                Icons.image_not_supported,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
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

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            'Feature Products',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () {
              // Show all products
            },
            child: const Text(
              'Show all',
              style: TextStyle(
                fontSize: 8,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}