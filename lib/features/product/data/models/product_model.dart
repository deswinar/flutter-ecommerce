import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required String id,
    required String name,
    String? description,
    double price = 0.0,
    double? originalPrice,
    bool isDiscounted = false,
    double rating = 0.0,
    int reviewCount = 0,
    int soldCount = 0,
    List<String>? imageGallery,
    String? category,
    String? imageUrl,
    List<String>? vouchers,
    bool freeShipping = false,
  }) : super(
          id: id,
          name: name,
          description: description,
          price: price,
          originalPrice: originalPrice,
          isDiscounted: isDiscounted,
          rating: rating,
          reviewCount: reviewCount,
          soldCount: soldCount,
          imageGallery: imageGallery,
          category: category,
          imageUrl: imageUrl,
          vouchers: vouchers,
          freeShipping: freeShipping,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      isDiscounted: json['isDiscounted'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: json['reviewCount'] as int? ?? 0,
      soldCount: json['soldCount'] as int? ?? 0,
      imageGallery: (json['imageGallery'] as List?)?.map((e) => e.toString()).toList(),
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] as String?,
      vouchers: (json['vouchers'] as List?)?.map((e) => e.toString()).toList(),
      freeShipping: json['freeShipping'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'originalPrice': originalPrice,
      'isDiscounted': isDiscounted,
      'rating': rating,
      'reviewCount': reviewCount,
      'soldCount': soldCount,
      'imageGallery': imageGallery,
      'category': category,
      'imageUrl': imageUrl,
      'vouchers': vouchers,
      'freeShipping': freeShipping,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      price: entity.price,
      originalPrice: entity.originalPrice,
      isDiscounted: entity.isDiscounted,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
      soldCount: entity.soldCount,
      imageGallery: entity.imageGallery,
      category: entity.category,
      imageUrl: entity.imageUrl,
      vouchers: entity.vouchers,
      freeShipping: entity.freeShipping,
    );
  }

  ProductEntity toEntity() => this;
}
