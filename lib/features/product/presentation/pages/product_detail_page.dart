import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/product_detail_cubit.dart';
import '../widgets/templates/product_detail_template.dart';
import '../widgets/organisms/product_detail_body.dart';
import '../../../../app/injection/injection.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProductDetailCubit>()..loadDetail(id),
      child: Scaffold(
        appBar: AppBar(title: const Text('Product Detail')),
        body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDetailLoaded) {
              return ProductDetailTemplate(
                header: Text('Product Details', style: Theme.of(context).textTheme.headlineMedium),
                filters: const Text('Filters go here if any'),
                onRefresh: () => context.read<ProductDetailCubit>().loadDetail(id),
                organism: ProductDetailBody(entity: state.item),
              );
            } else if (state is ProductDetailError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
