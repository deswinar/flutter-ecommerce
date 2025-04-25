import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/category_repository.dart';
import '../entities/category_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

@injectable
class UpdateCategoryUseCase implements UseCase<void, CategoryParams> {
  final CategoryRepository repository;

  UpdateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CategoryParams params) async {
    return repository.updateCategory(params.entity);
  }
}

class CategoryParams {
  final CategoryEntity entity;

  CategoryParams(this.entity);
}
