// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/app/injection/dio_module.dart' as _i121;
import 'package:ecommerce/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i796;
import 'package:ecommerce/features/auth/data/repositories/auth_repository_impl.dart'
    as _i689;
import 'package:ecommerce/features/auth/domain/repositories/auth_repository.dart'
    as _i33;
import 'package:ecommerce/features/auth/domain/usecases/reset_password_usecase.dart'
    as _i785;
import 'package:ecommerce/features/auth/domain/usecases/sign_in_usecase.dart'
    as _i263;
import 'package:ecommerce/features/auth/domain/usecases/sign_out_usecase.dart'
    as _i976;
import 'package:ecommerce/features/auth/domain/usecases/sign_up_usecase.dart'
    as _i466;
import 'package:ecommerce/features/category/data/datasources/category_remote_data_source.dart'
    as _i958;
import 'package:ecommerce/features/category/data/repositories/category_repository_impl.dart'
    as _i921;
import 'package:ecommerce/features/category/domain/repositories/category_repository.dart'
    as _i42;
import 'package:ecommerce/features/category/domain/usecases/create_category_usecase.dart'
    as _i483;
import 'package:ecommerce/features/category/domain/usecases/delete_category_usecase.dart'
    as _i397;
import 'package:ecommerce/features/category/domain/usecases/get_categories_usecase.dart'
    as _i142;
import 'package:ecommerce/features/category/domain/usecases/update_category_usecase.dart'
    as _i756;
import 'package:ecommerce/features/category/presentation/cubit/category_cubit.dart'
    as _i600;
import 'package:ecommerce/features/home/data/datasources/home_remote_data_source.dart'
    as _i512;
import 'package:ecommerce/features/home/data/repositories/home_repository_impl.dart'
    as _i1028;
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart'
    as _i572;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i669;
import 'package:ecommerce/features/product/data/datasources/product_remote_data_source.dart'
    as _i841;
import 'package:ecommerce/features/product/data/repositories/product_repository_impl.dart'
    as _i276;
import 'package:ecommerce/features/product/domain/repositories/product_repository.dart'
    as _i601;
import 'package:ecommerce/features/product/domain/usecases/create_product_usecase.dart'
    as _i319;
import 'package:ecommerce/features/product/domain/usecases/delete_product_usecase.dart'
    as _i493;
import 'package:ecommerce/features/product/domain/usecases/get_popular_products_usecase.dart'
    as _i49;
import 'package:ecommerce/features/product/domain/usecases/get_product_detail_usecase.dart'
    as _i564;
import 'package:ecommerce/features/product/domain/usecases/get_products_usecase.dart'
    as _i446;
import 'package:ecommerce/features/product/domain/usecases/update_product_usecase.dart'
    as _i234;
import 'package:ecommerce/features/product/presentation/cubit/customer/product_detail_customer_cubit.dart'
    as _i108;
import 'package:ecommerce/features/product/presentation/cubit/popular_product_cubit.dart'
    as _i422;
import 'package:ecommerce/features/product/presentation/cubit/product_cubit.dart'
    as _i845;
import 'package:ecommerce/features/product/presentation/cubit/product_detail_cubit.dart'
    as _i739;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.dioClient());
    gh.lazySingleton<_i512.HomeRemoteDataSource>(
        () => _i512.HomeRemoteDataSourceImpl());
    gh.lazySingleton<_i958.CategoryRemoteDataSource>(
        () => _i958.CategoryRemoteDataSourceImpl());
    gh.lazySingleton<_i841.ProductRemoteDataSource>(
        () => _i841.ProductRemoteDataSourceImpl());
    gh.lazySingleton<_i796.AuthRemoteDatasource>(
        () => _i796.AuthRemoteDatasourceImpl());
    gh.lazySingleton<_i572.HomeRepository>(
        () => _i1028.HomeRepositoryImpl(gh<_i512.HomeRemoteDataSource>()));
    gh.lazySingleton<_i42.CategoryRepository>(() =>
        _i921.CategoryRepositoryImpl(gh<_i958.CategoryRemoteDataSource>()));
    gh.lazySingleton<_i601.ProductRepository>(
        () => _i276.ProductRepositoryImpl(gh<_i841.ProductRemoteDataSource>()));
    gh.factory<_i483.CreateCategoryUseCase>(
        () => _i483.CreateCategoryUseCase(gh<_i42.CategoryRepository>()));
    gh.factory<_i397.DeleteCategoryUseCase>(
        () => _i397.DeleteCategoryUseCase(gh<_i42.CategoryRepository>()));
    gh.factory<_i142.GetCategoriesUseCase>(
        () => _i142.GetCategoriesUseCase(gh<_i42.CategoryRepository>()));
    gh.factory<_i756.UpdateCategoryUseCase>(
        () => _i756.UpdateCategoryUseCase(gh<_i42.CategoryRepository>()));
    gh.lazySingleton<_i33.AuthRepository>(
        () => _i689.AuthRepositoryImpl(gh<_i796.AuthRemoteDatasource>()));
    gh.factory<_i785.ResetPasswordUseCase>(
        () => _i785.ResetPasswordUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i263.SignInUseCase>(
        () => _i263.SignInUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i976.SignOutUseCase>(
        () => _i976.SignOutUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i466.SignUpUseCase>(
        () => _i466.SignUpUseCase(gh<_i33.AuthRepository>()));
    gh.factory<_i600.CategoryCubit>(
        () => _i600.CategoryCubit(gh<_i142.GetCategoriesUseCase>()));
    gh.factory<_i319.CreateProductUseCase>(
        () => _i319.CreateProductUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i493.DeleteProductUseCase>(
        () => _i493.DeleteProductUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i49.GetPopularProductsUseCase>(
        () => _i49.GetPopularProductsUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i446.GetProductsUseCase>(
        () => _i446.GetProductsUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i564.GetProductDetailUseCase>(
        () => _i564.GetProductDetailUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i234.UpdateProductUseCase>(
        () => _i234.UpdateProductUseCase(gh<_i601.ProductRepository>()));
    gh.factory<_i669.HomeCubit>(() => _i669.HomeCubit(
          gh<_i446.GetProductsUseCase>(),
          gh<_i142.GetCategoriesUseCase>(),
        ));
    gh.factory<_i422.PopularProductCubit>(
        () => _i422.PopularProductCubit(gh<_i446.GetProductsUseCase>()));
    gh.factory<_i845.ProductCubit>(
        () => _i845.ProductCubit(gh<_i446.GetProductsUseCase>()));
    gh.factory<_i108.ProductDetailCustomerCubit>(() =>
        _i108.ProductDetailCustomerCubit(gh<_i564.GetProductDetailUseCase>()));
    gh.factory<_i739.ProductDetailCubit>(
        () => _i739.ProductDetailCubit(gh<_i564.GetProductDetailUseCase>()));
    return this;
  }
}

class _$DioModule extends _i121.DioModule {}
