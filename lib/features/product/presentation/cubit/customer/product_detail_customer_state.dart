part of 'product_detail_customer_cubit.dart';

sealed class ProductDetailCustomerState {}

class ProductDetailCustomerInitial extends ProductDetailCustomerState {}

class ProductDetailCustomerLoading extends ProductDetailCustomerState {}

class ProductDetailCustomerLoaded extends ProductDetailCustomerState {
  final ProductUiModel item;

  ProductDetailCustomerLoaded({required this.item});
}

class ProductDetailCustomerError extends ProductDetailCustomerState {
  final String message;

  ProductDetailCustomerError(this.message);
}
