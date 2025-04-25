import 'package:flutter/material.dart';
import '../organisms/product_detail_body.dart';

class ProductDetailTemplate extends StatelessWidget {
  final Widget header;
  final Widget filters;
  final Function onRefresh;
  final Widget organism;

  const ProductDetailTemplate({
    Key? key,
    required this.header,
    required this.filters,
    required this.onRefresh,
    required this.organism,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        filters,
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              onRefresh();
            },
            child: organism,
          ),
        ),
      ],
    );
  }
}
