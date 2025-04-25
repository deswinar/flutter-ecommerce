import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';
import '../molecules/category_card.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryEntity> items;

  const CategoryList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => CategoryCard(entity: items[index]),
    );
  }
}
