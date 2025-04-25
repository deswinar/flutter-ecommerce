import 'package:ecommerce/shared/widgets/organisms/product_app_bar.dart';
import 'package:flutter/material.dart';
import '../../home/presentation/pages/home_page.dart';

class MenuItemConfig {
  final IconData icon;
  final String label;
  final Widget view;
  final PreferredSizeWidget? appBar;

  const MenuItemConfig({
    required this.icon,
    required this.label,
    required this.view,
    this.appBar,
  });
}

// TODO: Define your menu items here
// Example menu items
const List<MenuItemConfig> bottomNavItems = [
  MenuItemConfig(
    icon: Icons.home,
    label: 'Home',
    view: HomePage(),
    appBar: ProductAppBar(),
  ),
  MenuItemConfig(
    icon: Icons.favorite,
    label: 'Favorites',
    view: Text('Favorites'), // TODO: Favorites page
    appBar: null,
  ),
  MenuItemConfig(
    icon: Icons.receipt_long,
    label: 'Orders',
    view: Text('Orders'), // TODO: Orders page
    appBar: null,
  ),
  MenuItemConfig(
    icon: Icons.person,
    label: 'Profile',
    view: Text('Profile'), // TODO: User profile page
    appBar: null,
  ),
];


List<BottomNavigationBarItem> get bottomNavBarItems =>
    bottomNavItems
        .map((item) => BottomNavigationBarItem(icon: Icon(item.icon), label: item.label))
        .toList();
