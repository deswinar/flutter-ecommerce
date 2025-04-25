// lib/features/review/presentation/models/customer_review_ui_model.dart

class CustomerReviewUiModel {
  final String userName;
  final String userAvatarUrl;
  final double rating;
  final String comment;
  final DateTime createdAt;

  CustomerReviewUiModel({
    required this.userName,
    required this.userAvatarUrl,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });
}
