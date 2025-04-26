import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, void>> createProduct(ProductEntity entity);
  Future<Either<Failure, void>> updateProduct(ProductEntity entity);
  Future<Either<Failure, void>> deleteProduct(String id);
  Future<Either<Failure, ProductEntity>> getProductDetail(String id);

  Future<Either<Failure, List<ProductEntity>>> getPopularProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String category);
}
