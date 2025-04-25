import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

part 'product_state.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit(this.getProductsUseCase) : super(ProductInitial());

  Future<void> getData() async {
    emit(ProductLoading());
    final result = await getProductsUseCase(NoParams());
    result.fold(
      (failure) => emit(ProductError(_mapFailureToMessage(failure))),
      (items) => emit(ProductLoaded(items)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
