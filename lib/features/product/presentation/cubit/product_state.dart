
part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<ProductEntity> items;
  ProductLoaded(this.items);
}
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
