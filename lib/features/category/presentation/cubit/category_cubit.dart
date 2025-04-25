import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/entities/category_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

part 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  Future<void> getData() async {
    emit(CategoryLoading());
    final result = await getCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(CategoryError(_mapFailureToMessage(failure))),
      (items) => emit(CategoryLoaded(items)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.message;
  }
}
