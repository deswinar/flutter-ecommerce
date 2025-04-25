// lib/features/review/presentation/widgets/molecules/customer_review_list.dart

import 'package:flutter/material.dart';
import 'package:ecommerce/features/review/presentation/models/customer_review_ui_model.dart';
import 'package:ecommerce/features/review/presentation/widgets/molecules/customer_review_card.dart';

class CustomerReviewList extends StatelessWidget {
  final List<CustomerReviewUiModel> reviews;
  final VoidCallback? onSeeMore;

  const CustomerReviewList({
    super.key,
    required this.reviews,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Customer Reviews', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),

        ...reviews.map((review) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomerReviewCard(review: review),
            )),

        if (onSeeMore != null)
          TextButton(
            onPressed: onSeeMore,
            child: const Text('See more reviews'),
          ),

        const Divider(height: 32),
      ],
    );
  }
}
