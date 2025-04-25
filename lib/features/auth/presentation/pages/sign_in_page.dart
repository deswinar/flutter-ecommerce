import 'package:go_router/go_router.dart';

import '../widgets/templates/auth_template.dart';
import 'package:flutter/material.dart';

import '../widgets/organisms/sign_in_card.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      child: SignInCard(onLogin: () { 
        context.go('/main-menu');
       }, onForgotPassword: () {  }, onRegister: () { 
        context.go('/sign-up');
       },),
    );
  }
}
