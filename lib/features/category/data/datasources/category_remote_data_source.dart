import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> fetchCategories();
  Future<CategoryModel> fetchCategoryDetail(String id);
  Future<void> createCategory(CategoryModel model);
  Future<void> updateCategory(CategoryModel model);
  Future<void> deleteCategory(String id);
}

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    final response = await rootBundle.loadString('assets/mocks/categories.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>;

    return data.map((json) => CategoryModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  @override
  Future<CategoryModel> fetchCategoryDetail(String id) async {
    final response = await rootBundle.loadString('assets/mocks/categories.json');
    final List<dynamic> data = json.decode(response) as List<dynamic>;

    final jsonCategory = data.firstWhere(
      (element) => (element as Map<String, dynamic>)['id'] == id,
      orElse: () => throw Exception('Category not found'),
    );

    return CategoryModel.fromJson(jsonCategory as Map<String, dynamic>);
  }

  @override
  Future<void> createCategory(CategoryModel model) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Category created: ${model.name}');
  }

  @override
  Future<void> updateCategory(CategoryModel model) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Category updated: ${model.id}');
  }

  @override
  Future<void> deleteCategory(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Category deleted: $id');
  }
}
