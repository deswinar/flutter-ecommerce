import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';
import '../datasources/product_remote_data_source.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final result = await remoteDataSource.fetchProducts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
      await remoteDataSource.createProduct(model);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
      await remoteDataSource.updateProduct(model);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductDetail(String id) async {
    try {
      final result = await remoteDataSource.fetchProductDetail(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getPopularProducts() async {
    try {
      final result = await remoteDataSource.fetchPopularProducts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String category) async {
    try {
      final result = await remoteDataSource.fetchProductsByCategory(category);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return Left(ServerFailure('An unknown error occurred'));
    }
  }
}
