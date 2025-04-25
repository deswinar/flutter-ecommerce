import 'package:ecommerce/features/category/presentation/models/category_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/features/product/presentation/models/product_ui_model.dart';
import 'package:ecommerce/shared/widgets/molecules/empty_placeholder.dart';
import 'package:ecommerce/shared/widgets/organisms/category_shortucts.dart';

import '../atoms/section_title.dart';
import '../organisms/product_grid.dart';

class HomeTemplate extends StatelessWidget {
  final List<ProductUiModel> products;
  final List<CategoryUiModel> categories;
  final ValueChanged<ProductUiModel> onProductTap;

  const HomeTemplate({
    super.key,
    this.products = const [],
    this.categories = const [],
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Explore Local Products'),
          const SizedBox(height: 12),
          CategoryShortcuts(
            items: categories.map((category) {
              return CategoryShortcutItem(
                category: category,
                onTap: () {
                  // Handle category tap (e.g., navigate to category listing)
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          if (products.isEmpty)
            const EmptyPlaceholder(
              message: 'No products yet',
              asset: 'assets/images/no-product.png',
            )
          else
            ProductGrid(products: products, onProductTap: onProductTap,),
        ],
      ),
    );
  }
}
