import 'package:flutter/material.dart';
import '../../../domain/entities/product_entity.dart';
import '../molecules/product_card.dart';

class ProductList extends StatelessWidget {
  final List<ProductEntity> items;

  const ProductList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => ProductCard(entity: items[index]),
    );
  }
}
