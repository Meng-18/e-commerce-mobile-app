import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../widgets/home/feature_products.dart';
import 'product_detail_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String category;

  const ProductsScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> filteredProducts = FeatureProducts.products
        .where(
          (product) =>
              product.category.toLowerCase() ==
              category.toLowerCase(),
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          category,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: filteredProducts.isEmpty
          ? const Center(
              child: Text(
                'No products found',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.fromLTRB(
                20,
                10,
                20,
                20,
              ),

              itemCount: filteredProducts.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 18,
                childAspectRatio: 0.62,
              ),

              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(
                          product: product,
                        ),
                      ),
                    );
                  },

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10),

                          child: Image.network(
                            product.image,
                            width: double.infinity,
                            fit: BoxFit.cover,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}