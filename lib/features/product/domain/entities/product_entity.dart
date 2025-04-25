import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final double price;
  final double? originalPrice;
  final bool isDiscounted;
  final double rating;
  final int reviewCount;
  final int soldCount;
  final List<String>? imageGallery;
  final String? category;
  final String? imageUrl; // still included for backward use
  final List<String>? vouchers;
  final bool freeShipping;

  const ProductEntity({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.originalPrice,
    this.isDiscounted = false,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.soldCount = 0,
    this.imageGallery,
    this.category,
    this.imageUrl,
    this.vouchers,
    this.freeShipping = false,
  });

  @override
  List<Object?> get props => [
        id, name, description, price, originalPrice, isDiscounted,
        rating, reviewCount, soldCount,
        imageGallery, category, imageUrl, vouchers, freeShipping
      ];
}
