import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/organisms/product_app_bar.dart';
import '../cubit/product_by_category_cubit.dart';
import '../widgets/templates/product_by_category_template.dart';
import '../../../../app/injection/injection.dart';

class ProductByCategoryPage extends StatelessWidget {
  final String categoryId;
  
  const ProductByCategoryPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductByCategoryCubit>()..getData(categoryId),
      child: Scaffold(
        appBar: ProductAppBar(
          onSearchTap: () => print('Search tapped'),
          onCartTap: () => print('Cart tapped'),
          onChatTap: () => print('Chat tapped'),
          cartItemCount: 0,
        ),
        body: BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
          builder: (context, state) {
            if (state is ProductByCategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductByCategoryLoaded) {
              return ProductByCategoryTemplate(
                products: state.items, 
                onProductTap: (product) {
                  print('Product tapped: ${product.name}');
                  context.push('/customer/product/${product.id}');
                }
              );
            } else if (state is ProductByCategoryError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ProductByCategoryCubit>().getData(categoryId),
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
