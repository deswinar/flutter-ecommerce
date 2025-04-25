// lib/features/product/presentation/widgets/atoms/product_rating_summary.dart

import 'package:flutter/material.dart';

class ProductRatingSummary extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final int soldCount;

  const ProductRatingSummary({
    super.key,
    required this.rating,
    required this.reviewCount,
    required this.soldCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 16),
        const SizedBox(width: 4),
        Text('$rating', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 8),
        Text('($reviewCount reviews)', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(width: 8),
        Text('| $soldCount sold', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
