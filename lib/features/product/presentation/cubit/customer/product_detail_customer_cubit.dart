import 'package:ecommerce/core/errors/failures.dart';
import 'package:ecommerce/core/utils/formatters.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/domain/usecases/get_product_detail_usecase.dart';
import 'package:ecommerce/features/product/presentation/models/product_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'product_detail_customer_state.dart';

@injectable
class ProductDetailCustomerCubit extends Cubit<ProductDetailCustomerState> {
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailCustomerCubit(this.getProductDetailUseCase)
      : super(ProductDetailCustomerInitial());

  void loadDetail(String id) async {
    emit(ProductDetailCustomerLoading());

    final result = await getProductDetailUseCase(GetProductDetailParams(id: id));
    result.fold(
      (failure) => emit(ProductDetailCustomerError(_mapFailureToMessage(failure))),
      (entity) {
        final uiModel = _mapToProductUiModel(entity);
        emit(ProductDetailCustomerLoaded(item: uiModel));
      },
    );
  }

  ProductUiModel _mapToProductUiModel(ProductEntity entity) {
  return ProductUiModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    category: entity.category,
    imageUrl: entity.imageUrl ?? '',
    imageGallery: entity.imageGallery,
    formattedPrice: Formatters.formatPrice(entity.price.toInt()),
    formattedOriginalPrice: entity.originalPrice != null
        ? Formatters.formatPrice(entity.originalPrice!.toInt())
        : null,
    isDiscounted: entity.isDiscounted,
    rating: entity.rating,
    reviewCount: entity.reviewCount,
    soldCount: entity.soldCount,
    vouchers: entity.vouchers,
    freeShipping: entity.freeShipping,
  );
}


  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
