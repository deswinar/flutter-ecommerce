import 'package:flutter/material.dart';
import '../organisms/product_list.dart';
import '../../../domain/entities/product_entity.dart';

class ProductTemplate extends StatelessWidget {
  final List<ProductEntity> items;

  const ProductTemplate({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductList(items: items);
  }
}
