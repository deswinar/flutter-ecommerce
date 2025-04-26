

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:ecommerce/features/product/domain/entities/product_entity.dart';
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsByCategoryUsecase implements UseCase<List<ProductEntity>, GetProductsByCategoryParams> {
  final ProductRepository repository;

  GetProductsByCategoryUsecase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(GetProductsByCategoryParams params) async {
    return repository.getProductsByCategory(params.categoryId);
  }
}

class GetProductsByCategoryParams extends Equatable {
  final String categoryId;

  const GetProductsByCategoryParams({required this.categoryId});
  
  @override
  List<Object> get props => [categoryId];
}