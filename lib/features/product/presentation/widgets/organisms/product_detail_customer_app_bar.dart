import 'package:ecommerce/shared/widgets/molecules/search_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailCustomerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onCartTap;
  final VoidCallback? onShareTap;
  final ValueChanged<String>? onMenuSelected;
  final int cartItemCount;

  const ProductDetailCustomerAppBar({
    super.key,
    this.onSearchTap,
    this.onCartTap,
    this.onShareTap,
    this.onMenuSelected,
    this.cartItemCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => context.pop(),
      ),
      title: SearchProduct(onSearchTap: onSearchTap),
      actions: [
        IconButton(
          onPressed: onShareTap,
          icon: const Icon(Icons.share, color: Colors.black),
        ),
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
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onSelected: onMenuSelected,
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'report', child: Text('Report Product')),
            PopupMenuItem(value: 'help', child: Text('Help Center')),
            PopupMenuItem(value: 'wishlist', child: Text('Add to Wishlist')),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
