
part of 'product_by_category_cubit.dart';

abstract class ProductByCategoryState {}

class ProductByCategoryInitial extends ProductByCategoryState {}
class ProductByCategoryLoading extends ProductByCategoryState {}
class ProductByCategoryLoaded extends ProductByCategoryState {
  final List<ProductUiModel> items;
  ProductByCategoryLoaded(this.items);
}
class ProductByCategoryError extends ProductByCategoryState {
  final String message;
  ProductByCategoryError(this.message);
}
