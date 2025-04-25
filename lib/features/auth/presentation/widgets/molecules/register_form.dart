import 'package:flutter/material.dart';
import '../../../../../shared/widgets/atoms/app_text_field.dart';
import '../../../../../shared/widgets/atoms/primary_button.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback onRegister;

  const RegisterForm({
    super.key,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppTextField(hintText: 'Full Name'),
        const SizedBox(height: 12),
        const AppTextField(hintText: 'Email'),
        const SizedBox(height: 12),
        const AppTextField(hintText: 'Password', obscureText: true),
        const SizedBox(height: 20),
        PrimaryButton(label: 'Sign Up', onPressed: onRegister),
      ],
    );
  }
}