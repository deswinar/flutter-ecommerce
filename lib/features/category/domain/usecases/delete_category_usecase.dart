import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/category_repository.dart';
import '../entities/category_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

@injectable
class DeleteCategoryUseCase implements UseCase<void, CategoryIdParams> {
  final CategoryRepository repository;

  DeleteCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CategoryIdParams params) async {
    return repository.deleteCategory(params.id);
  }
}

class CategoryIdParams {
  final String id;

  CategoryIdParams(this.id);
}
