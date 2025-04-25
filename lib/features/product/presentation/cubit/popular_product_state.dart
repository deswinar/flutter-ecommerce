
part of 'popular_product_cubit.dart';

abstract class PopularProductState {}

class PopularProductInitial extends PopularProductState {}
class PopularProductLoading extends PopularProductState {}
class PopularProductLoaded extends PopularProductState {
  final List<ProductEntity> items;
  PopularProductLoaded(this.items);
}
class PopularProductError extends PopularProductState {
  final String message;
  PopularProductError(this.message);
}
