// lib/features/review/presentation/widgets/organisms/customer_review_list.dart

import 'package:flutter/material.dart';
import 'package:ecommerce/features/review/presentation/models/customer_review_ui_model.dart';
import 'package:ecommerce/features/review/presentation/widgets/organisms/customer_review_card.dart';
import 'package:ecommerce/features/review/presentation/widgets/molecules/rating_filter_chips.dart';

class CustomerReviewList extends StatefulWidget {
  final List<CustomerReviewUiModel> reviews;
  final VoidCallback? onSeeMore;

  const CustomerReviewList({
    super.key,
    required this.reviews,
    this.onSeeMore,
  });

  @override
  State<CustomerReviewList> createState() => _CustomerReviewListState();
}

class _CustomerReviewListState extends State<CustomerReviewList> {
  int? selectedRating;

  List<CustomerReviewUiModel> get filteredReviews {
    if (selectedRating == null) return widget.reviews;
    return widget.reviews.where((r) => r.rating.floor() == selectedRating).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Customer Reviews', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),

        RatingFilterChips(
          selectedRating: selectedRating,
          onChanged: (value) => setState(() => selectedRating = value),
        ),

        const SizedBox(height: 16),

        if (filteredReviews.isEmpty)
          Text(
            'No reviews for ${selectedRating ?? ''} stars.',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        else
          ...filteredReviews.map((review) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomerReviewCard(review: review),
              )),

        if (widget.onSeeMore != null)
          TextButton(
            onPressed: widget.onSeeMore,
            child: const Text('See more reviews'),
          ),

        const Divider(height: 32),
      ],
    );
  }
}
