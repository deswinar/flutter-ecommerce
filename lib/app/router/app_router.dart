import 'package:ecommerce/features/product/presentation/pages/customer/product_detail_customer_page.dart';

import '../../features/main_menu/presentation/pages/main_menu_page.dart';

import '../../features/auth/presentation/pages/getting_started_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    // Define your routes here
    GoRoute(path: '/', builder: (context, state) => const GettingStartedPage()),
    GoRoute(path: '/sign-in', builder: (context, state) => const SignInPage()),
    GoRoute(path: '/sign-up', builder: (context, state) => const SignUpPage()),
    GoRoute(path: '/main-menu', builder: (context, state) => const MainMenuPage()),
    GoRoute(
      path: '/customer/product/:id',
      name: 'customer_product_detail',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailCustomerPage(id: productId);
      },
    ),
  ],
);
