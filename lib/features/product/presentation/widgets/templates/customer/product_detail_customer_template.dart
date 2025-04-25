// lib/features/product/presentation/widgets/templates/customer/product_detail_customer_template.dart

import 'package:ecommerce/features/product/presentation/widgets/molecules/product_rating_summary.dart';
import 'package:ecommerce/features/product/presentation/widgets/organisms/product_offer_section.dart';
import 'package:ecommerce/features/review/presentation/widgets/organisms/customer_review_list.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/features/product/presentation/models/product_ui_model.dart';
import 'package:ecommerce/features/review/presentation/models/customer_review_ui_model.dart';
import 'package:ecommerce/shared/widgets/atoms/price_text.dart';

// Dummy reviews (replace with real data in integration)
final dummyReviews = [
  CustomerReviewUiModel(
    userName: 'John Doe',
    userAvatarUrl: 'https://i.pravatar.cc/150?img=1',
    rating: 4.5,
    comment: 'Really fresh product, would definitely buy again!',
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  CustomerReviewUiModel(
    userName: 'Jane Smith',
    userAvatarUrl: 'https://i.pravatar.cc/150?img=2',
    rating: 4.0,
    comment: 'Tastes great and delivery was fast.',
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
  ),
];

class ProductDetailCustomerTemplate extends StatelessWidget {
  final ProductUiModel item;

  const ProductDetailCustomerTemplate({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- IMAGE ---
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              item.imageUrl,
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          // --- NAME ---
          Text(
            item.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: 8),

          // --- PRICE ---
          PriceText(price: item.formattedPrice),

          const SizedBox(height: 8),

          // --- RATING, REVIEW & SOLD ---
          ProductRatingSummary(
            rating: item.rating,
            reviewCount: item.reviewCount,
            soldCount: item.soldCount,
          ),

          const Divider(height: 32),

          // --- OFFERS ---
          ProductOffersSection(
            vouchers: item.vouchers,
            freeShipping: item.freeShipping,
          ),

          // --- REVIEWS ---
          CustomerReviewList(
            reviews: dummyReviews,
            onSeeMore: () {
              // TODO: Hook with actual pagination logic
            },
          ),

          // --- DESCRIPTION ---
          Text('Product Description', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            item.description ?? 'No description available.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
