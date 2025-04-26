// lib/features/review/presentation/widgets/molecules/rating_filter_chips.dart

import 'package:flutter/material.dart';

class RatingFilterChips extends StatelessWidget {
  final int? selectedRating;
  final ValueChanged<int?> onChanged;

  const RatingFilterChips({
    super.key,
    required this.selectedRating,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          final rating = 5 - index;
          final isSelected = selectedRating == rating;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text('$rating ★'),
              selected: isSelected,
              onSelected: (_) {
                onChanged(isSelected ? null : rating);
              },
            ),
          );
        }),
      ),
    );
  }
}
