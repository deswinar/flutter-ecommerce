import 'package:ecommerce/features/category/presentation/models/category_ui_model.dart';
import 'package:flutter/material.dart';

class CategoryShortcutItem {
  final CategoryUiModel category;
  final VoidCallback onTap;

  CategoryShortcutItem({
    required this.category,
    required this.onTap,
  });
}

class CategoryShortcuts extends StatelessWidget {
  final List<CategoryShortcutItem> items;

  const CategoryShortcuts({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, // or adjust to your design
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: item.onTap,
            child: Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: AssetImage(item.category.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.category.name,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
