import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

@injectable
class GetProductDetailUseCase implements UseCase<ProductEntity, GetProductDetailParams> {
  final ProductRepository repository;

  GetProductDetailUseCase(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(GetProductDetailParams params) async {
    return repository.getProductDetail(params.id);
  }
}

class GetProductDetailParams extends Equatable {
  final String id;

  const GetProductDetailParams({required this.id});

  @override
  List<Object> get props => [id];
}
