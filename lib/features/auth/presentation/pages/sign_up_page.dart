// TODO: Build SignUpPage UI and logic
import 'package:ecommerce/features/auth/presentation/widgets/organisms/sign_up_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/templates/auth_template.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      child: SignUpCard(
        onRegister: () {
          context.go('/sign-in');
        },
        onLogin: () {
          context.go('/sign-in');
        },
      ),
    );
  }
}
