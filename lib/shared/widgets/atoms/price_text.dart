import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String price;
  final TextStyle? style;

  const PriceText({
    super.key,
    required this.price,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(price, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green[700]));
  }
}
