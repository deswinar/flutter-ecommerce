import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<ProductModel> fetchProductDetail(String id);
  Future<void> createProduct(ProductModel model);
  Future<void> updateProduct(ProductModel model);
  Future<void> deleteProduct(String id);

  Future<List<ProductModel>> fetchPopularProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await rootBundle.loadString('assets/mocks/products.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>;

    return data.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<ProductModel> fetchProductDetail(String id) async {
    final response = await rootBundle.loadString('assets/mocks/products.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>;

    final jsonProduct = data.firstWhere(
      (element) => (element as Map<String, dynamic>)['id'] == id,
      orElse: () => throw Exception('Product not found'),
    );

    return ProductModel.fromJson(jsonProduct as Map<String, dynamic>);
  }

  @override
  Future<void> createProduct(ProductModel model) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    // Mock: Just log or print to simulate the process
    print('Product created: ${model.name}');
  }

  @override
  Future<void> updateProduct(ProductModel model) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Product updated: ${model.id}');
  }

  @override
  Future<void> deleteProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Product deleted: $id');
  }

  @override
  Future<List<ProductModel>> fetchPopularProducts() async {
    final response = await rootBundle.loadString('assets/mocks/products.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>;

    return data.map((json) => ProductModel.fromJson(json as Map<String, dynamic>)).toList();
  }
}