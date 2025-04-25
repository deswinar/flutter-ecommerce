import 'package:ecommerce/app/injection/injection.dart';
import 'package:ecommerce/features/product/presentation/cubit/customer/product_detail_customer_cubit.dart';
import 'package:ecommerce/features/product/presentation/widgets/organisms/product_detail_customer_app_bar.dart';
import 'package:ecommerce/features/product/presentation/widgets/templates/customer/product_detail_customer_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCustomerPage extends StatelessWidget {
  final String id;

  const ProductDetailCustomerPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductDetailCustomerCubit>()..loadDetail(id),
      child: Scaffold(
        appBar: ProductDetailCustomerAppBar(
        onSearchTap: () => print('Search tapped'),
        onShareTap: () => print('Share tapped'),
        onCartTap: () => print('Cart tapped'),
        onMenuSelected: (value) {
          print('Menu selected: $value');
          // Handle actions
        },
        cartItemCount: 3,
      ),
        body: BlocBuilder<ProductDetailCustomerCubit, ProductDetailCustomerState>(
          builder: (context, state) {
            if (state is ProductDetailCustomerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailCustomerLoaded) {
              return ProductDetailCustomerTemplate(
                item: state.item,
              );
            } else if (state is ProductDetailCustomerError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => print('Chat tapped'),
                  icon: const Icon(Icons.chat, size: 20),
                  label: const Text('Chat'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => print('Add to cart tapped'),
                  icon: const Icon(Icons.add_shopping_cart, size: 20),
                  label: const Text('Add to Cart'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => print('Buy Now tapped'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Buy Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
