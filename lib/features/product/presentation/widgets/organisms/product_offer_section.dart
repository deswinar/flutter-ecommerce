// lib/features/product/presentation/widgets/molecules/product_offers_section.dart

import 'package:flutter/material.dart';
import 'package:ecommerce/features/product/presentation/widgets/molecules/offer_chip.dart';

class ProductOffersSection extends StatelessWidget {
  final List<String>? vouchers;
  final bool freeShipping;

  const ProductOffersSection({
    super.key,
    this.vouchers,
    required this.freeShipping,
  });

  @override
  Widget build(BuildContext context) {
    final hasOffers = (vouchers?.isNotEmpty ?? false) || freeShipping;

    if (!hasOffers) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Offers', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (freeShipping)
              const OfferChip(label: 'Free Shipping', icon: Icons.local_shipping),
            ...?vouchers?.map(
              (voucher) => OfferChip(label: voucher, icon: Icons.card_giftcard),
            ),
          ],
        ),
        const Divider(height: 32),
      ],
    );
  }
}
