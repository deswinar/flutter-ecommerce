// lib/features/product/presentation/models/product_ui_model.dart
class ProductUiModel {
  final String id;
  final String name;
  final String formattedPrice;
  final String? formattedOriginalPrice;
  final bool isDiscounted;
  final String imageUrl;
  final List<String>? imageGallery;
  final double rating;
  final int reviewCount;
  final int soldCount;
  final String? description;
  final String? category;
  final List<String>? vouchers;
  final bool freeShipping;

  ProductUiModel({
    required this.id,
    required this.name,
    required this.formattedPrice,
    this.formattedOriginalPrice,
    this.isDiscounted = false,
    required this.imageUrl,
    this.imageGallery,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.soldCount = 0,
    this.description,
    this.category,
    this.vouchers,
    this.freeShipping = false,
  });
}
