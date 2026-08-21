import 'package:flutter/material.dart';

class SmallCollections extends StatelessWidget {
  const SmallCollections({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: Row(
        children: [
          Expanded(
            child: _collectionCard(
              title: 'T-Shirts',
              subtitle: 'The\nOffice\nLife',
              image:
                  'https://images.unsplash.com/photo-1551488831-00ddcb6c6bd3?auto=format&fit=crop&w=300&q=80',
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: _collectionCard(
              title: 'Dresses',
              subtitle: 'Elegant\nDesign',
              image:
                  'https://images.unsplash.com/photo-1566174053879-31528523f8ae?auto=format&fit=crop&w=300&q=80',
            ),
          ),
        ],
      ),
    );
  }

  Widget _collectionCard({
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 7,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 9,
                      height: 1.15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Image
          Expanded(
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
    );
  }
}