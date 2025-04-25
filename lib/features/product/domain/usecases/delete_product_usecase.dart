import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../repositories/product_repository.dart';
import '../entities/product_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

@injectable
class DeleteProductUseCase implements UseCase<void, ProductIdParams> {
  final ProductRepository repository;

  DeleteProductUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(ProductIdParams params) async {
    return repository.deleteProduct(params.id);
  }
}

class ProductIdParams {
  final String id;

  ProductIdParams(this.id);
}
