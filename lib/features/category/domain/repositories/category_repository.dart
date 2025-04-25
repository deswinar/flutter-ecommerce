import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, void>> createCategory(CategoryEntity entity);
  Future<Either<Failure, void>> updateCategory(CategoryEntity entity);
  Future<Either<Failure, void>> deleteCategory(String id);
}
