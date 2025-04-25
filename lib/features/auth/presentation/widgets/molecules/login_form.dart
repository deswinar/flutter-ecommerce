import 'package:flutter/material.dart';
import '../../../../../shared/widgets/atoms/app_text_field.dart';
import '../../../../../shared/widgets/atoms/primary_button.dart';
import '../atoms/text_link.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onForgotPassword;

  const LoginForm({
    super.key,
    required this.onLogin,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppTextField(hintText: 'Email'),
        const SizedBox(height: 12),
        const AppTextField(hintText: 'Password', obscureText: true),
        const SizedBox(height: 12),
        TextLink(text: 'Forgot Password?', onTap: onForgotPassword),
        const SizedBox(height: 20),
        PrimaryButton(label: 'Sign In', onPressed: onLogin),
      ],
    );
  }
}