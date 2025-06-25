import 'package:flutter/material.dart';

class MovieCaroulselCard extends StatelessWidget {
  final String imageUrl;
  final String rating;

  const MovieCaroulselCard({
    super.key,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imageUrl, width: 200, fit: BoxFit.cover),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  rating.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.amber, size: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
