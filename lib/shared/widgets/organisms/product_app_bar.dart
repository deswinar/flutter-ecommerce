import 'package:ecommerce/shared/widgets/molecules/search_product.dart';
import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onChatTap;
  final int cartItemCount;

  const ProductAppBar({
    super.key,
    this.onSearchTap,
    this.onCartTap,
    this.onChatTap,
    this.cartItemCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 16,
      backgroundColor: Colors.white,
      elevation: 0,
      title: SearchProduct(onSearchTap: onSearchTap),
      actions: [
        IconButton(
          onPressed: onCartTap,
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart, color: Colors.black),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  top: 2,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          onPressed: onChatTap,
          icon: const Icon(Icons.chat, color: Colors.black),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

