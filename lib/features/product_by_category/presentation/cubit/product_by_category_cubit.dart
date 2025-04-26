import 'package:ecommerce/core/utils/formatters.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/domain/usecases/get_products_by_category_usecase.dart';
import 'package:ecommerce/features/product/presentation/models/product_ui_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

part 'product_by_category_state.dart';

@injectable
class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  final GetProductsByCategoryUsecase getProductByCategorysUseCase;

  ProductByCategoryCubit(this.getProductByCategorysUseCase) : super(ProductByCategoryInitial());

  Future<void> getData(String id) async {
    emit(ProductByCategoryLoading());
    final result = await getProductByCategorysUseCase(GetProductsByCategoryParams(categoryId: id));
    result.fold(
      (failure) => emit(ProductByCategoryError(_mapFailureToMessage(failure))),
      (items) {
        final uiModels = items.map(_mapToProductUiModel).toList();
        emit(ProductByCategoryLoaded(uiModels));
      },
    );
  }

  ProductUiModel _mapToProductUiModel(ProductEntity entity) {
    return ProductUiModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      isDiscounted: entity.isDiscounted,
      rating: entity.rating,
      reviewCount: entity.reviewCount,
      soldCount: entity.soldCount,
      imageUrl: entity.imageUrl ?? '',
      freeShipping: entity.freeShipping, 
      formattedPrice: Formatters.formatPrice(entity.price as int),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
