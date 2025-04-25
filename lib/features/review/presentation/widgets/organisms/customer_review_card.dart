// lib/features/review/presentation/widgets/molecules/customer_review_card.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/customer_review_ui_model.dart';

class CustomerReviewCard extends StatelessWidget {
  final CustomerReviewUiModel review;

  const CustomerReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMM yyyy').format(review.createdAt);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(review.userAvatarUrl),
          radius: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(review.userName, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${review.rating}', style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(width: 8),
                  Text(formattedDate, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              Text(review.comment, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        )
      ],
    );
  }
}
