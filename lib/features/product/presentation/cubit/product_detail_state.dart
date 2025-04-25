part of 'product_detail_cubit.dart';

abstract class ProductDetailState {}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductEntity item;

  ProductDetailLoaded({required this.item});
}

class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError(this.message);
}
