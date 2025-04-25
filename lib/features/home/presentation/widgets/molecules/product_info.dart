import 'package:ecommerce/shared/widgets/atoms/price_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart'; // Optional for better icons

class ProductInfo extends StatelessWidget {
  final String name;
  final String price;
  final double rating;

  const ProductInfo({
    super.key,
    required this.name,
    required this.price,
    this.rating = 4.5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber[600], size: 16),
            const SizedBox(width: 4),
            Text(rating.toStringAsFixed(1), style: theme.textTheme.bodySmall),
            const Spacer(),
            PriceText(price: price,),
          ],
        ),
      ],
    );
  }
}
