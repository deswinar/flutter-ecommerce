import 'package:flutter/material.dart';

class OfferChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const OfferChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16, color: Theme.of(context).primaryColor),
      label: Text(label),
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    );
  }
}