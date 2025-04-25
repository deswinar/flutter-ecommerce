import 'package:ecommerce/core/utils/formatters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

import '../../../category/domain/entities/category_entity.dart';
import '../../../category/domain/usecases/get_categories_usecase.dart';
import '../../../category/presentation/models/category_ui_model.dart';

import '../../../product/domain/entities/product_entity.dart';
import '../../../product/domain/usecases/get_products_usecase.dart';
import '../../../product/presentation/models/product_ui_model.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  HomeCubit(
    this.getProductsUseCase,
    this.getCategoriesUseCase,
  ) : super(HomeInitial());

  Future<void> getData() async {
    emit(HomeLoading());

    final productResult = await getProductsUseCase(NoParams());
    final categoryResult = await getCategoriesUseCase(NoParams());

    if (productResult.isLeft() || categoryResult.isLeft()) {
      final errorMessage = productResult.fold(
        (failure) => _mapFailureToMessage(failure),
        (_) => '',
      );
      emit(HomeError(errorMessage));
      return;
    }

    final products = productResult.getOrElse(() => []);
    final categories = categoryResult.getOrElse(() => []);

    final productUiModels = products.map(_mapToProductUiModel).toList();
    final categoryUiModels = categories.map(_mapToCategoryUiModel).toList();

    emit(HomeLoaded(
      products: productUiModels,
      categories: categoryUiModels,
    ));
  }

  ProductUiModel _mapToProductUiModel(ProductEntity entity) {
    return ProductUiModel(
      id: entity.id,
      description: entity.description,
      category: entity.category,
      imageUrl: entity.imageUrl ?? '',
      name: entity.name,
      formattedPrice: Formatters.formatPrice(entity.price as int),
    );
  }

  CategoryUiModel _mapToCategoryUiModel(CategoryEntity entity) {
    return CategoryUiModel(
      name: entity.name,
      imageUrl: entity.imageUrl ?? '',
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
