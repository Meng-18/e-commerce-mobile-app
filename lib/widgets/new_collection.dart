import 'package:e_commerce_mobile_app/screen/model/product.dart';
import 'package:e_commerce_mobile_app/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class NewCollection extends StatelessWidget {
  const NewCollection({super.key});

  static const String imageUrl =
      'https://images.unsplash.com/photo-1524250502761-1ac6f2e30d43?auto=format&fit=crop&w=500&q=80';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: GestureDetector(
        onTap: () {
          // Convert collection item into Product model
          const product = Product(
            name: 'HANG OUT & PARTY',
            price: '\$49.99',
            image: imageUrl,
            category: 'New Collection',
          );

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductDetailScreen(product: product),
            ),
          );
        },
        child: Container(
          height: 108,
          decoration: BoxDecoration(
            color: const Color(0xfffff8fa),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 13),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NEW COLLECTION',
                        style: TextStyle(
                          fontSize: 7,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'HANG OUT\n& PARTY',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.image_outlined,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}