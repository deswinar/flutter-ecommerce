import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

part 'popular_product_state.dart';

@injectable
class PopularProductCubit extends Cubit<PopularProductState> {
  final GetProductsUseCase getProductsUseCase;

  PopularProductCubit(this.getProductsUseCase) : super(PopularProductInitial());

  Future<void> getData() async {
    emit(PopularProductLoading());
    final result = await getProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(PopularProductError(_mapFailureToMessage(failure))),
      (items) => emit(PopularProductLoaded(items)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
