import 'package:flutter/material.dart';
import '../../../domain/entities/category_entity.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity entity;

  const CategoryCard({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(entity.name),
        subtitle: Text('ID: ${entity.id}'),
      ),
    );
  }
}
