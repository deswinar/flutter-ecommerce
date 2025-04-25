import 'package:flutter/material.dart';
import '../../../domain/entities/product_entity.dart';

class ProductDetailBody extends StatelessWidget {
  final ProductEntity? entity;

  const ProductDetailBody({super.key, this.entity});

  @override
  Widget build(BuildContext context) {
    if (entity == null) {
      return const Center(child: Text('No data available.'));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Detail', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text('Entity Name: ${entity!.name}'),  // Example field from entity
          // Add more fields from the entity as needed
        ],
      ),
    );
  }
}
