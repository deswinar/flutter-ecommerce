import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/get_product_detail_usecase.dart';
import '../../domain/entities/product_entity.dart';
import '../../../../core/errors/failures.dart';

part 'product_detail_state.dart';

@injectable
class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductDetailUseCase getProductDetailUseCase;

  ProductDetailCubit(this.getProductDetailUseCase) : super(ProductDetailInitial());

  void loadDetail(String id) async {
    emit(ProductDetailLoading());
    final result = await getProductDetailUseCase(GetProductDetailParams(id: id));
    result.fold(
      (failure) => emit(ProductDetailError(_mapFailureToMessage(failure))),
      (item) => emit(ProductDetailLoaded(item: item)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
