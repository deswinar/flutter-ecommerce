import 'package:flutter/material.dart';
import '../organisms/category_list.dart';
import '../../../domain/entities/category_entity.dart';

class CategoryTemplate extends StatelessWidget {
  final List<CategoryEntity> items;

  const CategoryTemplate({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CategoryList(items: items);
  }
}
