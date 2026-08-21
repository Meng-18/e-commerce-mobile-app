import 'package:e_commerce_mobile_app/screen/model/product.dart';
import 'package:e_commerce_mobile_app/screen/product_detail_screen.dart';
import 'package:flutter/material.dart';

class TopCollection extends StatelessWidget {
  const TopCollection({super.key});

  final List<Map<String, String>> collections = const [
    {
      'smallText': 'Sale up to 40%',
      'title': 'FOR SLIM\n& BEAUTY',
      'image':
          'https://images.unsplash.com/photo-1529139574466-a303027c1d8b?auto=format&fit=crop&w=500&q=80',
    },
    {
      'smallText': 'Summer Collection 2021',
      'title': 'Most sexy\n& fabulous\ndesign',
      'image':
          'https://images.unsplash.com/photo-1539109136881-3be0616acf4b?auto=format&fit=crop&w=500&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 22),

        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                'Top Collection',
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

        // Collection Cards
        ListView.builder(
          itemCount: collections.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final collection = collections[index];

            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
              child: _collectionCard(
                context: context,
                smallText: collection['smallText']!,
                title: collection['title']!,
                image: collection['image']!,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _collectionCard({
    required BuildContext context,
    required String smallText,
    required String title,
    required String image,
  }) {
    return GestureDetector(
      onTap: () {
        // Convert collection data to your Product model
        final product = Product(
          name: title.replaceAll('\n', ' '),
          price: smallText,
          image: image,
          category: 'Top Collection',
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Text
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      smallText,
                      style: const TextStyle(
                        fontSize: 6,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Image
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: Image.network(
                  image,
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
    );
  }
}